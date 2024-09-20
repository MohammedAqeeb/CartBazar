import 'package:bloc/bloc.dart';

class GenderSelecionCubit extends Cubit<int> {
  GenderSelecionCubit() : super(1);

  int defaultIndex = 1;

  void selectedIndex(int index) {
    defaultIndex = index;
    emit(index);
  }
}
