// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import './index_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavbarState> {
  BottomNavBarCubit() : super(BottomNavBarInitState());

  void changeNavBarIndex(int index) {
    emit(BottomNavBarChangeIndexState(index: index));
  }
}
