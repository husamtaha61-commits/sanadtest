import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../data/models/requests/approve_request_request.dart';
import '../../../domain/usecases/approve_request_use_case.dart';
import '../../../domain/usecases/cancel_request_use_case.dart';
import '../../../domain/usecases/reject_request_use_case.dart';

part 'my_requests_actions_state.dart';
part 'my_requests_actions_cubit.freezed.dart';

@injectable
class MyRequestsActionsCubit extends Cubit<MyRequestsActionsState> {
  final CancelRequestUseCase cancelRequestUseCase;
  final RejectRequestUseCase rejectRequestUseCase;
  final ApproveRequestUseCase approveRequestUseCase;
  MyRequestsActionsCubit(
    this.cancelRequestUseCase,
    this.rejectRequestUseCase,
    this.approveRequestUseCase,
  ) : super(const MyRequestsActionsState());

  void cancelRequest(int requestId) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await cancelRequestUseCase(requestId);
    response.when(
      success: (data) => emit(state.copyWith(
        status: const BaseStatus.success(),
        requestId: requestId,
        requestStatusId: 5,
      )),
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }

  void rejectRequest(int requestId) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await rejectRequestUseCase(requestId);
    response.when(
      success: (data) => emit(state.copyWith(
        status: const BaseStatus.success(),
        requestId: requestId,
        requestStatusId: 3,
      )),
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }

  void approveRequest(ApproveRequestRequest approveRequestRequest) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await approveRequestUseCase(approveRequestRequest);
    response.when(
      success: (data) => emit(state.copyWith(
        status: const BaseStatus.success(),
        requestId: approveRequestRequest.scheduleRequestId,
        requestStatusId: 2,
      )),
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }

  void chooseSelectedSession(int? value) {
    emit(state.copyWith(
      approvedSuggestionId: value,
      status: const BaseStatus.initial(),
    ));
  }
}
