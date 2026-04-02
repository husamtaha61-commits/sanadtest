import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../domain/usecases/add_session_token_use_case.dart';

part 'session_token_state.dart';
part 'session_token_cubit.freezed.dart';

@injectable
class SessionTokenCubit extends Cubit<SessionTokenState> {
  final AddSessionTokenUseCase addSessionTokenUseCase;
  SessionTokenCubit(this.addSessionTokenUseCase)
      : super(const SessionTokenState());

  void addSessionToken(String id) async {
    emit(state.copyWith(status: const Loading()));
    final response = await addSessionTokenUseCase(id);
    response.when(
      success: (data) => emit(state.copyWith(status: const Success())),
      failure: (error) => emit(state.copyWith(status: const Failure())),
    );
  }
}
