import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../features/shared/presentation/bloc/lookup/lookup_cubit.dart';
import '../../routes/app_router.dart';
import '../../services/app_preferences.dart';
import '../../services/localization_service.dart';
import '../../services/twilio_chat_service.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

@lazySingleton
class AppCubit extends Cubit<AppState> {
  final LocalizationService localizationService;
  final AppPreferences appPreferences;
  AppCubit(this.localizationService, this.appPreferences)
      : super(const AppState());

  final scrollController = ScrollController(keepScrollOffset: false);

  Future<void> storeLang(BuildContext context, String langCode,
      [bool resetRouterStack = true]) async {
    await localizationService.setLocale(context, langCode);
    await appPreferences.storeLang(langCode);
    if (resetRouterStack) {
      await TwilioChatService.shutdown();
      // ignore: use_build_context_synchronously
      Phoenix.rebirth(context);
      // ignore: use_build_context_synchronously
      context.router.replaceAll([MainRoute()], updateExistingRoutes: false);
    } else {
      context.read<LookupCubit>().getLookUpsData();
    }
  }

  void scrollTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(0);
    });
  }
}
