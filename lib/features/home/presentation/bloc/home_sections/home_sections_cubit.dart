import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../domain/entites/home_section.dart';
import '../../../domain/usecases/get_home_sections_use_case.dart';

part 'home_sections_state.dart';
part 'home_sections_cubit.freezed.dart';

@injectable
class HomeSectionsCubit extends Cubit<HomeSectionsState> {
  HomeSectionsCubit(this.getHomeSectionsUseCase)
      : super(const HomeSectionsState());
  final GetHomeSectionsUseCase getHomeSectionsUseCase;

  void getHomeSections() async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final response = await getHomeSectionsUseCase();
    response.when(
      success: (sections) {
        // Debug logging
        print('[HomeSectionsCubit] Received ${sections.length} sections');
        for (var section in sections) {
          print('[HomeSectionsCubit] Section: id=${section.id}, '
              'sectionTypeId=${section.sectionTypeId}, '
              'type=${section.sectionType.name}, '
              'title=${section.title}, '
              'visible=${section.visible}, '
              'order=${section.orderNumber}');
        }

        final sortedSections = sections
            .where((section) => section.visible)
            .toList()
          ..sort((a, b) => a.orderNumber.compareTo(b.orderNumber));

        print(
            '[HomeSectionsCubit] After filtering/sorting: ${sortedSections.length} sections');
        print(
            '[HomeSectionsCubit] Section order: ${sortedSections.map((s) => s.sectionType.name).join(', ')}');

        emit(
          state.copyWith(
            status: const BaseStatus.success(),
            sections: sortedSections,
          ),
        );
      },
      failure: (error) {
        print('[HomeSectionsCubit] Error fetching sections: $error');
        emit(state.copyWith(status: const BaseStatus.failure()));
      },
    );
  }

  List<SectionType> getSectionOrder() {
    return state.sections.map((section) => section.sectionType).toList();
  }
}
