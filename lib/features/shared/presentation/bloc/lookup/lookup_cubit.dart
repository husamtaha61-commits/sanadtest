import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/entities/base_field.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/services/app_preferences.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/usecases/get_lookups_data_usecase.dart';

part 'lookup_state.dart';
part 'lookup_cubit.freezed.dart';

@injectable
class LookupCubit extends Cubit<LookupState> {
  GetLookUpsDataUseCase getLookUpsDataUseCase;
  final AppPreferences appPreferences;
  LookupCubit(this.getLookUpsDataUseCase, this.appPreferences)
      : super(const LookupState());

  void getLookUpsData() async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await getLookUpsDataUseCase(getLookUpsDataIntValues());
    response.when(
      success: (lookUpsDataResponse) {
        appPreferences.cacheLookUpDataResponse(lookUpsDataResponse);
        emit(
          state.copyWith(
            status: const BaseStatus.success(),
            ageRanges: lookUpsDataResponse.ageRanges,
            countries: lookUpsDataResponse.countries,
            genders: lookUpsDataResponse.genders,
            languages: lookUpsDataResponse.languages,
            nationalities: lookUpsDataResponse.nationalities,
            recitations: lookUpsDataResponse.recitations,
            recitationTypes: lookUpsDataResponse.recitationTypes,
            userIdTypes: lookUpsDataResponse.userIdTypes,
            requestStatuses: lookUpsDataResponse.requestStatuses,
            requestTypes: lookUpsDataResponse.requestTypes,
            requesterSides: lookUpsDataResponse.requesterSide,
            days: lookUpsDataResponse.days,
            averageIntervals: lookUpsDataResponse.averageIntervals,
          ),
        );
      },
      failure: (error) {
        final lookUpDataCachedResponse =
            appPreferences.getLookUpDataCachedResponse();
        emit(
          state.copyWith(
            status: BaseStatus.failure(error),
            ageRanges: lookUpDataCachedResponse?.ageRanges ?? [],
            countries: lookUpDataCachedResponse?.countries ?? [],
            genders: lookUpDataCachedResponse?.genders ?? [],
            languages: lookUpDataCachedResponse?.languages ?? [],
            nationalities: lookUpDataCachedResponse?.nationalities ?? [],
            recitations: lookUpDataCachedResponse?.recitations ?? [],
            recitationTypes: lookUpDataCachedResponse?.recitationTypes ?? [],
            userIdTypes: lookUpDataCachedResponse?.userIdTypes ?? [],
            requestStatuses: lookUpDataCachedResponse?.requestStatuses ?? [],
            requestTypes: lookUpDataCachedResponse?.requestTypes ?? [],
            requesterSides: lookUpDataCachedResponse?.requesterSide ?? [],
            days: lookUpDataCachedResponse?.days ?? [],
            averageIntervals: lookUpDataCachedResponse?.averageIntervals ?? [],
          ),
        );
      },
    );
  }
}
