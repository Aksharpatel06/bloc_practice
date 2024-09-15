import 'package:flutter_bloc/flutter_bloc.dart';

sealed class Counter {}

class CounterIncrement extends Counter {}

class CounterDecrement extends Counter {}

class CounterBloc extends Bloc<Counter, int> {
  CounterBloc() : super(0) {
    on<CounterIncrement>(_counterIncrement);
    on<CounterDecrement>(_counterDecrement);
  }

  void _counterIncrement(CounterIncrement even, Emitter emit) {
    emit(state + 1);
  }

  void _counterDecrement(CounterDecrement even, Emitter emit) {
    if (state > 0) {
      emit(state - 1);
    }
  }
}
