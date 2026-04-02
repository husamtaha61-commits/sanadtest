import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';

import '../../data/models/requests/announcement_request.dart';
import '../entites/announcement.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class GetAnnouncementsUseCase {
  final HomeRepository homeRepository;

  GetAnnouncementsUseCase({required this.homeRepository});

  Future<ApiResult<List<Announcement>>> call(
      AnnouncementRequest announcementRequest) async {
    return await homeRepository.getAnnouncements(announcementRequest);
  }
}
