import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../domain/entities/my_request.dart';
import '../../domain/repositories/my_requests_repository.dart';

import '../datasources/my_requests_remote_data_source.dart';

import '../models/requests/approve_request_request.dart';
import '../models/requests/my_requests_request.dart';

@LazySingleton(as: MyRequestsRepository)
class MyRequestsRepositoryImp implements MyRequestsRepository {
  final MyRequestsRemoteDataSource myRequestsRemoteDataSource;

  MyRequestsRepositoryImp({required this.myRequestsRemoteDataSource});
  @override
  Future<ApiResult<List<MyRequest>>> getMyRequests(
      MyRequestsRequest myRequestsRequest) async {
    final result =
        await myRequestsRemoteDataSource.getMyRequests(myRequestsRequest);
    return result.when(
      success: (paginationResponse) {
        final List<MyRequest> myRequests = paginationResponse.data
            .map((item) => MyRequest.fromResponse(item))
            .toList();

        return ApiResult.success(myRequests);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult> cancelRequest(int requestId) async {
    return await myRequestsRemoteDataSource.cancelRequest(requestId);
  }

  @override
  Future<ApiResult> rejectRequest(int requestId) async {
    return await myRequestsRemoteDataSource.rejectRequest(requestId);
  }

  @override
  Future<ApiResult> approveRequest(ApproveRequestRequest approveRequestRequest) async {
    return await myRequestsRemoteDataSource.approveRequest(approveRequestRequest);
  }

  @override
  Future<ApiResult<MyRequest>> getRequestById(int id) async {
    final result = await myRequestsRemoteDataSource.getRequestById(id);
    return result.when(
      success: (requestResponse) {
        final MyRequest myRequests = MyRequest.fromResponse(requestResponse);
        return ApiResult.success(myRequests);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }
}
