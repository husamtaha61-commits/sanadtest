import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../../session_details/domain/entites/note.dart';
import '../../../data/models/note_filter_request.dart';
import '../../../domain/usecases/get_all_notes_use_case.dart';

part 'note_state.dart';
part 'note_cubit.freezed.dart';

@injectable
class NoteCubit extends Cubit<NoteState> {
  final GetAllNotesUseCase _getAllNotesUseCase;

  NoteCubit(this._getAllNotesUseCase) : super(const NoteState());

  final int _pageSize = 10;
  final PagingController<int, Note> pagingController =
      PagingController(firstPageKey: 1);

  void _fetchNotes({
    required int pageKey,
    bool? isAuthoredByMe,
    String? sessionId,
    int? studentId,
    bool resetPaging = false,
  }) async {
    if (resetPaging) {
      pagingController.itemList = [];
      emit(state.copyWith(status: const BaseStatus.loading()));
    }

    final response = await _getAllNotesUseCase(NoteFilterRequest(
      pageNumber: pageKey,
      pageSize: _pageSize,
      isAuthoredByMe: isAuthoredByMe,
      sessionId: sessionId,
      studentId: studentId
    ));

    response.when(
      success: (notes) {
        final isLastPage = notes.length < _pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(notes);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(notes, nextPageKey);
        }
        emit(state.copyWith(status: const BaseStatus.success(), notes: notes));
      },
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }

  void getNotesByPage(
      {bool? isAuthoredByMe, int pageKey = 1, String? sessionId, int? studentId}) {
    _fetchNotes(
      pageKey: pageKey,
      isAuthoredByMe: isAuthoredByMe,
      sessionId: sessionId,
      studentId: studentId
    );
  }

  void getAllNotes({bool? isAuthoredByMe, String? sessionId, int? studentId}) {
    _fetchNotes(
      pageKey: 1,
      resetPaging: true,
      isAuthoredByMe: isAuthoredByMe,
      sessionId: sessionId,
      studentId: studentId,
    );
  }
}
