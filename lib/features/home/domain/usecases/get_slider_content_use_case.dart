import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';

import '../../data/models/requests/slider_request.dart';
import '../entites/slider_content.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class GetSliderContentUseCase {
  final HomeRepository homeRepository;

  GetSliderContentUseCase({required this.homeRepository});

  Future<ApiResult<List<SliderContent>>> call(
      SliderRequest sliderRequest) async {
    return await homeRepository.getSlider(sliderRequest);
  }
}
