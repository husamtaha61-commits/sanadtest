import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/di/injection.dart';
import '../../../../../../core/models/base_status.dart';
import '../../../../../../core/services/app_preferences.dart';
import '../../../data/models/responses/reciter_filters_request.dart';
import '../../../domain/entites/reciter.dart';
import '../../../domain/usecases/get_reciters_use_case.dart';

part 'reciter_listing_state.dart';
part 'reciter_listing_cubit.freezed.dart';

@injectable
class ReciterListingCubit extends Cubit<ReciterListingState> {
  final GetRecitersUseCase getRecitersUseCase;
  ReciterListingCubit(this.getRecitersUseCase)
      : super(const ReciterListingState());

  final int _pageSize = 10;
  final PagingController<int, Reciter> pagingController =
      PagingController(firstPageKey: 1);

  final search = TextEditingController();

  final List<int> selectedDays = [];
  final List<int> selectedPeriods = [];

  final List<int> ages = [];
  final List<int> genders = [];
  final List<int> recitations = [];
  final List<int> teachingLanguages = [];
  final List<int> reciterLanguages = [];
  final List<int> nationalities = [];

  TextEditingController searchReciterLanguage = TextEditingController();
  TextEditingController searchNationality = TextEditingController();

  bool favoritesOnly = false;

  void getRecitersByPage(
      [int pageKey = 1,
      bool availableForLiveSession = false,
      int? genderId]) async {
    if (pageKey == 1) {
      emit(state.copyWith(status: const BaseStatus.loading()));
    }
    final response = await getRecitersUseCase(
      ReciterFiltersRequest(
        searchTerm: search.text.trim(),
        days: selectedDays,
        periods: selectedPeriods,
        ageRanges: ages,
        genderId: genderId ?? (genders.isNotEmpty ? genders.first : null),
        teachingLanguagesIds: teachingLanguages,
        mainLangaugeId:
            reciterLanguages.isNotEmpty ? reciterLanguages.first : null,
        recitationId: recitations.isNotEmpty ? recitations.first : null,
        nationalityId: nationalities.isNotEmpty ? nationalities.first : null,
        pageNumber: pageKey,
        pageSize: _pageSize,
        favoritesOnly: favoritesOnly,
        programId:
            getIt<AppPreferences>().getUserCachedResponse().programId ?? 2,
        availableForLiveSession: availableForLiveSession,
      ),
    );

    response.when(
      success: (recitersResponse) {
        final isLastPage = recitersResponse.length < _pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(recitersResponse);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(recitersResponse, nextPageKey);
        }
        emit(state.copyWith(status: const BaseStatus.success()));
      },
      failure: (error) {},
    );
  }

  void addDay(int id) => _updateList(selectedDays, id);
  void addTime(int id) => _updateList(selectedPeriods, id);
  void addAge(int id) => _updateList(ages, id);
  void addGender(int id) => _updateListWithOneItem(genders, id);
  void addRecitation(int id) => _updateListWithOneItem(recitations, id);
  void addTeachingLanguage(int id) => _updateList(teachingLanguages, id);
  void addReciterLanguage(int id) =>
      _updateListWithOneItem(reciterLanguages, id);
  void addNationality(int id) => _updateListWithOneItem(nationalities, id);
  void toggleFav() {
    favoritesOnly = !favoritesOnly;
    pagingController.refresh();
    if (state.status is Failure) {
      favoritesOnly = !favoritesOnly;
    }
  }

  void _updateListWithOneItem(List<int> list, int id) {
    withStateEmission(() {
      if (list.contains(id)) {
        list.clear();
      } else {
        list.clear();
        list.add(id);
      }
    });
  }

  void _updateList(List<int> list, int id) {
    withStateEmission(() {
      if (list.contains(id)) {
        list.remove(id);
      } else {
        list.add(id);
      }
    });
  }

  void resetDrawerFilterOptions() {
    withStateEmission(() {
      ages.clear();
      genders.clear();
      recitations.clear();
      teachingLanguages.clear();
      reciterLanguages.clear();
      nationalities.clear();
      pagingController.refresh();
    });
  }

  void withStateEmission(VoidCallback callback) {
    emit(state.copyWith(status: const BaseStatus.initial()));
    callback();
    emit(state.copyWith(status: const BaseStatus.success()));
  }

  @override
  Future<void> close() {
    pagingController.dispose();
    return super.close();
  }
}
