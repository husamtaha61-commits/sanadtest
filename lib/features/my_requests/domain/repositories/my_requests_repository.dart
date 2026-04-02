import '../../../../core/network/api_response.dart';
import '../../data/models/requests/approve_request_request.dart';
import '../../data/models/requests/my_requests_request.dart';
import '../entities/my_request.dart';

abstract class MyRequestsRepository {
  Future<ApiResult<List<MyRequest>>> getMyRequests(MyRequestsRequest myRequestsRequest);
  Future<ApiResult<MyRequest>> getRequestById(int id);
  Future<ApiResult> cancelRequest(int requestId);
  Future<ApiResult> rejectRequest(int requestId);
  Future<ApiResult> approveRequest(ApproveRequestRequest approveRequestRequest);
}
