import 'package:bloc/bloc.dart';
import 'package:f_project/modules/bmi_app/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>{
  // CounterCubit(CounterStates initialState) : super(initialState);

  CounterCubit() : super(CounterInitialStates());// not state but start is

  // CounterCubit cubit = BlocProvider.of(context);

  static CounterCubit getCounterCubit (context) => BlocProvider.of(context);

  int counter = 1;

  minus (){
    if (counter > 0) {
      counter--;
     emit(CounterMinusStates(counter));
    }
  }

  plus (){
      counter++;
      emit(CounterPlusStates(counter));

  }
}