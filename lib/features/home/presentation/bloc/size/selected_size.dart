import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedSizeCubit extends Cubit<int> {
  SelectedSizeCubit() : super(0);

  int selectedSize = 0;

  void selectSize(int index) {
    selectedSize = index;
    emit(index);
  }
}
