import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedColorCubit extends Cubit<int> {
  SelectedColorCubit() : super(0);

  int selectedIndex = 0;

  void changeColor(int index) {
    selectedIndex = index;
    emit(index);
  }
}
