import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/models/base_status.dart';
import '../../../domain/entites/reciter_statistics.dart';
import '../../../domain/usecases/get_reciter_statistics_use_case.dart';

part 'reciter_statistics_state.dart';
part 'reciter_statistics_cubit.freezed.dart';

@injectable
class ReciterStatisticsCubit extends Cubit<ReciterStatisticsState> {
  final GetReciterStatisticsUseCase _getReciterStatisticsUseCase;
  ReciterStatisticsCubit(this._getReciterStatisticsUseCase)
      : super(const ReciterStatisticsState());

  void getReciterStatistics() async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final response = await _getReciterStatisticsUseCase();
    response.when(
      success: (reciterStatistics) {
        emit(state.copyWith(
          status: const BaseStatus.success(),
          reciterStatistics: reciterStatistics,
        ));
      },
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }
}
