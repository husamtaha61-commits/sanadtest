import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../domain/entities/messaging_contact.dart';
import '../../../domain/usecases/get_messaging_contacts_use_case.dart';

part 'messaging_contact_state.dart';
part 'messaging_contact_cubit.freezed.dart';

@injectable
class MessagingContactCubit extends Cubit<MessagingContactState> {
  final GetMessagingContactsUseCase _getMessagingContactsUseCase;
  MessagingContactCubit(this._getMessagingContactsUseCase)
      : super(const MessagingContactState());

  void getContacts() async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await _getMessagingContactsUseCase();
    response.when(
      success: (contacts) => emit(state.copyWith(
          status: const BaseStatus.success(), contacts: contacts)),
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }
}
