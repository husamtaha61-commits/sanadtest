import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/models/base_status.dart';
import '../../../domain/entites/reciter.dart';
import '../../../domain/usecases/get_reciter_by_id_use_case.dart';
import '../../../domain/usecases/toggle_is_receiving_students_use_case.dart';

part 'reciter_details_state.dart';
part 'reciter_details_cubit.freezed.dart';

@injectable
class ReciterDetailsCubit extends Cubit<ReciterDetailsState> {
  final GetReciterByIdUseCase _getReciterByIdUseCase;
  final SetIsReceivingStudentsUseCase _setIsReceivingStudentsUseCase;
  ReciterDetailsCubit(
      this._getReciterByIdUseCase,
      this._setIsReceivingStudentsUseCase
  ) : super(const ReciterDetailsState());

  void getReciterById(int reciterId) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await _getReciterByIdUseCase(reciterId);
    response.when(
      success: (reciterResponse) {
        emit(
          state.copyWith(
            status: const BaseStatus.success(),
            reciter: reciterResponse,
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(status: const BaseStatus.failure()));
      },
    );
  }

  void updateReciterIsFavorite(bool isFav) {
    final reciter = state.reciter!.copyWith(isFavorite: isFav);
    emit(state.copyWith(reciter: reciter));
  }

  void setIsReceivingNewStudents(bool isReceivingNewStudents) async {
    emit(state.copyWith(actionStatus: const BaseStatus.loading()));
    final response = await _setIsReceivingStudentsUseCase(isReceivingNewStudents);
    response.when(
      success: (isReceivingNewStudents) => emit(
          state.copyWith(
            actionStatus: const BaseStatus.success(),
            reciter: state.reciter?.copyWith(isReceivingNewStudents: isReceivingNewStudents),
          )
      ),
      failure: (error) => emit(
          state.copyWith(actionStatus: const BaseStatus.failure())
      )
    );
  }

}
