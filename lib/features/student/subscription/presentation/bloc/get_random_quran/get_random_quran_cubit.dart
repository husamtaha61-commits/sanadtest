import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/models/base_status.dart';
import '../../../data/models/responses/get_random_quran_response.dart';
import '../../../domain/usecases/get_random_quran_usecase.dart';

part 'get_random_quran_cubit.freezed.dart';
part 'get_random_quran_state.dart';

@injectable
class GetRandomQuranCubit extends Cubit<GetRandomQuranState> {
  GetRandomQuranUseCase getRandomQuranUseCase;
  GetRandomQuranCubit(this.getRandomQuranUseCase)
      : super(const GetRandomQuranState());

  void getRandomQuran() async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await getRandomQuranUseCase();
    response.when(
      success: (quranResponse) {
        emit(
          state.copyWith(
              status: const BaseStatus.success(), quranTemplate: quranResponse),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            status: BaseStatus.failure(error),
          ),
        );
      },
    );
  }

  void setStartRecording() {
    emit(state.copyWith(isStartRecording: true));
  }

  void setFontLoaded() {
    emit(state.copyWith(isFontLoaded: true));
  }
}
