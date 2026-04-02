import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../data/models/requests/slider_request.dart';
import '../../../domain/entites/slider_content.dart';
import '../../../domain/usecases/get_slider_content_use_case.dart';

part 'slider_content_state.dart';
part 'slider_content_cubit.freezed.dart';

@injectable
class SliderContentCubit extends Cubit<SliderContentState> {
  final GetSliderContentUseCase getSliderContentUseCase;
  SliderContentCubit(this.getSliderContentUseCase)
      : super(const SliderContentState());

  void getSliderContent() async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final response = await getSliderContentUseCase(
      SliderRequest(isDisabled: false),
    );
    response.when(
      success: (sliderContent) {
        emit(state.copyWith(
          status: const BaseStatus.success(),
          sliderContent: sliderContent.take(5).toList(),
        ));
      },
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }
}
