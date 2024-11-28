// use of BLoC state management

// this bloc is a controller that keeps tracks on which icon is currently selected at the bottom nav bar

import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int>{
  BottomNavCubit(): super(0);
  changeSelectedIndex(newIndex)=> emit(newIndex);
}