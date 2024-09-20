import 'package:bloc/bloc.dart';

class SelectedAgeCubit extends Cubit<String> {
  SelectedAgeCubit() : super('Age Rage');

  String defaultAge = '';

  void selectedAge(String age) {
    defaultAge = age;
    emit(defaultAge);
  }
}
