import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../domain/entites/global_reciters_section.dart';
import '../../../domain/usecases/get_global_reciters_section_use_case.dart';

part 'global_reciters_section_state.dart';
part 'global_reciters_section_cubit.freezed.dart';

@injectable
class GlobalRecitersSectionCubit extends Cubit<GlobalRecitersSectionState> {
  final GetGlobalRecitersSectionUseCase getGlobalRecitersSectionUseCase;

  GlobalRecitersSectionCubit(this.getGlobalRecitersSectionUseCase)
      : super(const GlobalRecitersSectionState());

  void getRecitersGlobalSection() async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final response = await getGlobalRecitersSectionUseCase();
    response.when(
      success: (globalRecitersSection) {
        emit(state.copyWith(
          status: const BaseStatus.success(),
          globalRecitersSection: globalRecitersSection,
        ));
      },
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }
}
