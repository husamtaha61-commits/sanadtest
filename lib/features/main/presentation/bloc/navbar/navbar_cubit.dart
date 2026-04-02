import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'navbar_state.dart';
part 'navbar_cubit.freezed.dart';

@injectable
class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit() : super(const NavbarState());

  void updateIndex(int index) {
    emit(state.copyWith(index: index));
  }
}
