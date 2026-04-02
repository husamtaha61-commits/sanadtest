import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../data/models/requests/action_center_filter_request.dart';
import '../../../domain/entites/action_center.dart';
import '../../../domain/usecases/get_actions_center_use_case.dart';

part 'action_center_state.dart';
part 'action_center_cubit.freezed.dart';

@injectable
class ActionCenterCubit extends Cubit<ActionCenterState> {
  final GetActionsCenterUseCase _getActionsCenterUseCase;
  ActionCenterCubit(this._getActionsCenterUseCase)
      : super(const ActionCenterState());

  final int _pageSize = 10;
  final PagingController<int, ActionCenter> pagingController =
      PagingController(firstPageKey: 1);

  void getActionsCenterByPage({int pageKey = 1}) async {
    if(state.status == const BaseStatus.loading()) {
      return;
    }
    if (pageKey == 1) {
      emit(state.copyWith(status: const BaseStatus.loading()));
      pagingController.refresh();
    }

    final response = await _getActionsCenterUseCase(ActionCenterFilterRequest(
      pageNumber: pageKey,
      pageSize: _pageSize,
    ));

    response.when(
      success: (actions) {
        final isLastPage = actions.length < _pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(actions);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(actions, nextPageKey);
        }
        emit(state.copyWith(
          status: const BaseStatus.success(),
          actions: pagingController.itemList ?? [],
        ));
      },
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }
}
