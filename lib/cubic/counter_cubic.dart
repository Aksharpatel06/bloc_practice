import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubic extends Cubit<int> {
  CounterCubic():super(0);

  void increment()
  {
    emit(state+1);
  }
}