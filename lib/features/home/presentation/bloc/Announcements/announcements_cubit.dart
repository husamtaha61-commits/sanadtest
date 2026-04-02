import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../data/models/requests/announcement_request.dart';
import '../../../domain/entites/announcement.dart';
import '../../../domain/usecases/get_announcements_use_case.dart';

part 'announcements_state.dart';
part 'announcements_cubit.freezed.dart';

@injectable
class AnnouncementsCubit extends Cubit<AnnouncementsState> {
  final GetAnnouncementsUseCase getAnnouncementsUseCase;
  AnnouncementsCubit(this.getAnnouncementsUseCase)
      : super(const AnnouncementsState());

  void getAnnouncements() async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final response =
        await getAnnouncementsUseCase(AnnouncementRequest(isActive: true));
    response.when(
      success: (announcements) {
        emit(state.copyWith(
          status: const BaseStatus.success(),
          announcements: announcements,
        ));
      },
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }
}
