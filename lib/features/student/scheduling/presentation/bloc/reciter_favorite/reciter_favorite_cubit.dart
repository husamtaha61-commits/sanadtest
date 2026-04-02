import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/models/base_status.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../domain/usecases/add_reciter_to_favorite_use_case.dart';
import '../../../domain/usecases/delete_reciter_from_favorite_use_case.dart';

part 'reciter_favorite_state.dart';
part 'reciter_favorite_cubit.freezed.dart';

@injectable
class ReciterFavoriteCubit extends Cubit<ReciterFavoriteState> {
  final AddReciterToFavoriteUseCase addReciterToFavoriteUseCase;
  final DeleteReciterToFavoriteUseCase deleteReciterToFavoriteUseCase;
  ReciterFavoriteCubit(
      this.addReciterToFavoriteUseCase, this.deleteReciterToFavoriteUseCase)
      : super(const ReciterFavoriteState());

  void addReciterToFavorite(int reciterId) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await addReciterToFavoriteUseCase(reciterId);
    response.when(
      success: (reciterResponse) {
        emit(
          state.copyWith(
              status: const BaseStatus.success(),
              isFav: true,
              msg: LocaleKeys.snackbar_reciterAddedToFav),
        );
      },
      failure: (error) {
        emit(state.copyWith(status: const BaseStatus.failure()));
      },
    );
  }

  void deleteReciterFromFavorite(int reciterId) async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final response = await deleteReciterToFavoriteUseCase(reciterId);
    response.when(
      success: (reciterResponse) {
        emit(
          state.copyWith(
            status: const BaseStatus.success(),
            isFav: false,
            msg: LocaleKeys.snackbar_reciterRemovedFromFav,
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(status: const BaseStatus.failure()));
      },
    );
  }
}
