import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/network/retrofit_client.dart';
import '../../../../core/responses/base_pagination_response.dart';
import '../../../session_details/data/models/bookmark_response.dart';
import '../../../session_details/data/models/note_response.dart';
import '../models/bookmark_filter_request.dart';
import '../models/note_filter_request.dart';
import '../models/skill_response.dart';
import '../models/user_subscription_ids_response.dart';

abstract class SkillsNotesRemoteDataSource {
  Future<ApiResult<BasePaginationResponse<NoteResponse>>> getAllNotes(
      NoteFilterRequest noteFilterRequest);

  Future<ApiResult<BasePaginationResponse<BookmarkGroupResponse>>>
      getAllBookmarks(BookmarkFilterRequest bookmarkFilterRequest);

  Future<ApiResult<UserSubscriptionIdsResponse>> getSubscriptionByStudentId(
      int studentId);

  Future<ApiResult<List<SkillResponse>>> getUserSkillsBySubscriptionId(
      int subscriptionId);
}

@LazySingleton(as: SkillsNotesRemoteDataSource)
class SkillsNotesRemoteDataSourceImp implements SkillsNotesRemoteDataSource {
  final RetrofitClient retrofitClient;

  SkillsNotesRemoteDataSourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<BasePaginationResponse<NoteResponse>>> getAllNotes(
      NoteFilterRequest noteFilterRequest) {
    return apiHandler<BasePaginationResponse<NoteResponse>>(
      () => retrofitClient.getAllNotes(
        noteFilterRequest.pageNumber,
        noteFilterRequest.pageSize,
        noteFilterRequest.isAuthoredByMe,
        noteFilterRequest.sessionId,
        noteFilterRequest.studentId
      ),
    );
  }

  @override
  Future<ApiResult<BasePaginationResponse<BookmarkGroupResponse>>>
      getAllBookmarks(BookmarkFilterRequest bookmarkFilterRequest) {
    return apiHandler<BasePaginationResponse<BookmarkGroupResponse>>(
      () => retrofitClient.getAllBookmarks(
        bookmarkFilterRequest.pageNumber,
        bookmarkFilterRequest.pageSize,
        bookmarkFilterRequest.groupBySurahId,
        bookmarkFilterRequest.sessionId
      ),
    );
  }

  @override
  Future<ApiResult<UserSubscriptionIdsResponse>> getSubscriptionByStudentId(
      int studentId) {
    return apiHandler<UserSubscriptionIdsResponse>(
        () => retrofitClient.getSubscriptionByStudentId(studentId));
  }

  @override
  Future<ApiResult<List<SkillResponse>>> getUserSkillsBySubscriptionId(
      int subscriptionId) {
    return apiHandler<List<SkillResponse>>(
        () => retrofitClient.getUserSkillsBySubscriptionId(subscriptionId));
  }
}
