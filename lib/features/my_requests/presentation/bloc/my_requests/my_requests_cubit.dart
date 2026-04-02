import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../../../core/network/api_response.dart';
import '../../../data/models/requests/my_requests_request.dart';
import '../../../data/models/responses/my_requests_response.dart';
import '../../../domain/entities/my_request.dart';
import '../../../domain/usecases/get_my_requests_use_case.dart';
import '../../../domain/usecases/get_request_by_id_use_case.dart';

part 'my_requests_state.dart';
part 'my_requests_cubit.freezed.dart';

@injectable
class MyRequestsCubit extends Cubit<MyRequestsState> {
  final GetMyRequestsUseCase _getMyRequestsUseCase;
  final GetRequestsByIdUseCase _getRequestsByIdUseCase;
  MyRequestsCubit(
      this._getMyRequestsUseCase,
      this._getRequestsByIdUseCase
  ) : super(const MyRequestsState());

  final int _pageSize = 10;
  final PagingController<int, dynamic> pagingController =
      PagingController(firstPageKey: 1);


  void getMyRequests([int pageKey = 1]) async {
    pagingController.itemList = [];

    emit(state.copyWith(requestListStatus: const BaseStatus.loading()));
    final response = await _getMyRequestsUseCase(
      MyRequestsRequest(
        statusId: state.requestStatuses.firstOrNull,
        typeId: state.requestTypes.firstOrNull,
        requesterSideId: state.requesterSides.firstOrNull,
        pageNumber: pageKey,
        pageSize: _pageSize,
      ),
    );

    response.when(
      success: (myRequestsResponse) {
        final isLastPage = myRequestsResponse.length < _pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(myRequestsResponse);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(myRequestsResponse, nextPageKey);
        }
        emit(
          state.copyWith(
            requestListStatus: const BaseStatus.success(),
            myRequests: myRequestsResponse,
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(requestListStatus: const BaseStatus.failure()));
      },
    );
  }

  void getMyRequestsByPage([int pageNumber = 1]) async {
    final response = await _getMyRequestsUseCase(
      MyRequestsRequest(
        statusId: state.requestStatuses.firstOrNull,
        typeId: state.requestTypes.firstOrNull,
        requesterSideId: state.requesterSides.firstOrNull,
        pageNumber: pageNumber,
        pageSize: _pageSize,
      ),
    );

    response.when(
      success: (recitersResponse) {
        final isLastPage = recitersResponse.length < _pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(recitersResponse);
        } else {
          final nextPageKey = pageNumber + 1;
          pagingController.appendPage(recitersResponse, nextPageKey);
        }
        final List<MyRequest> newList = List.from(state.myRequests);
        newList.addAll(recitersResponse);
        emit(state.copyWith(myRequests: newList));
      },
      failure: (error) {},
    );
  }

  void addRequestStatus(int id) => _updateListWithOneItem(
        state.requestStatuses,
        id,
        (updatedList) => state.copyWith(requestStatuses: updatedList),
      );

  void addRequestType(int id) => _updateListWithOneItem(
        state.requestTypes,
        id,
        (updatedList) => state.copyWith(requestTypes: updatedList),
      );

  void addRequestSide(int id) => _updateListWithOneItem(
        state.requesterSides,
        id,
        (updatedList) => state.copyWith(requesterSides: updatedList),
      );

  void _updateListWithOneItem(
      List<int> list, int id, Function(List<int>) updateState) {
    List<int> updatedList = List.from(list);
    if (updatedList.contains(id)) {
      updatedList.clear();
    } else {
      updatedList.clear();
      updatedList.add(id);
    }
    emit(updateState(updatedList));
  }

  void resetDrawerFilterOptions() {
    emit(
      state.copyWith(
        requestStatuses: [],
        requestTypes: [],
        requesterSides: [],
      ),
    );
  }

  void updateRequestAfterAction(int id, int statusId, String statusName) {
    final List<MyRequest> updatedRequests = state.myRequests
        .map((request) => request.requestId != id
            ? request
            : request.copyWith(status: Status(id: statusId, name: statusName)))
        .toList();

    pagingController.itemList = updatedRequests;
    emit(state.copyWith(myRequests: updatedRequests));
  }

  Future<ApiResult<MyRequest>> getRequestById(int initialRequestId) async {
    emit(state.copyWith(requestByIdStatus: const BaseStatus.loading()));
    final response = await _getRequestsByIdUseCase(initialRequestId);

    response.when(
        success: (_) {
          emit(state.copyWith(requestByIdStatus: const BaseStatus.success()));
        },
        failure: (_) {
          emit(state.copyWith(requestByIdStatus: const BaseStatus.success()));
        }
    );
    return response;
  }
}
