import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/retrofit_client.dart';
import '../../../../core/responses/base_pagination_response.dart';
import '../models/requests/approve_request_request.dart';
import '../models/requests/my_requests_request.dart';
import '../models/responses/my_requests_response.dart';

abstract class MyRequestsRemoteDataSource {
  Future<ApiResult<BasePaginationResponse<MyRequestsResponse>>> getMyRequests(MyRequestsRequest myRequestsRequest);

  Future<ApiResult> cancelRequest(int requestId);
  Future<ApiResult> rejectRequest(int requestId);
  Future<ApiResult> approveRequest(ApproveRequestRequest approveRequestRequest);

  Future<ApiResult<MyRequestsResponse>> getRequestById(int id);
}

@LazySingleton(as: MyRequestsRemoteDataSource)
class MyRequestsRemoteDataSourceImp implements MyRequestsRemoteDataSource {
  final RetrofitClient retrofitClient;

  MyRequestsRemoteDataSourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<BasePaginationResponse<MyRequestsResponse>>> getMyRequests(MyRequestsRequest myRequestsRequest) {
    return apiHandler<BasePaginationResponse<MyRequestsResponse>>(
      () => retrofitClient.getMyRequests(
        myRequestsRequest.statusId,
        myRequestsRequest.typeId,
        myRequestsRequest.requesterSideId,
        myRequestsRequest.pageNumber,
        myRequestsRequest.pageSize,
        myRequestsRequest.searchTerm,
      ),
    );
  }

  @override
  Future<ApiResult> cancelRequest(int requestId) {
    return apiHandler(() => retrofitClient.cancelRequest(requestId));
  }

  @override
  Future<ApiResult> rejectRequest(int requestId) {
    return apiHandler(() => retrofitClient.rejectRequest(requestId));
  }

  @override
  Future<ApiResult> approveRequest(ApproveRequestRequest approveRequestRequest) {
    return apiHandler(
        () => retrofitClient.approveRequest(approveRequestRequest));
  }

  @override
  Future<ApiResult<MyRequestsResponse>> getRequestById(int id) {
    return apiHandler(() => retrofitClient.getRequestById(id));
  }
}
