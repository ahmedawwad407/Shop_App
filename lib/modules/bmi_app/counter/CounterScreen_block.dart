import 'package:f_project/modules/bmi_app/counter/cubit/cubit.dart';
import 'package:f_project/modules/bmi_app/counter/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreenBloc extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //BlocProvider.of(context)
    //CounterCubit cubit = BlocProvider.of(context);
    //cubit.counter;

    //===

    // CounterCubit cubit = CounterCubit.getCounterCubit(context);
    // cubit.counter;


    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (BuildContext context,CounterStates state){
          if(state is CounterMinusStates) print('CounterMinusStates ${state.counter}');
          if(state is CounterPlusStates)  print('CounterPlusStates  ${state.counter}');
        },
        builder:  (BuildContext context,CounterStates state){
          return Scaffold(
            appBar: AppBar(
              title: Text('Counter'),
            ),
            body: Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      CounterCubit.getCounterCubit(context).minus();
                    },
                    child: Text(
                      "-",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.grey;
                          }
                        })),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "${CounterCubit.getCounterCubit(context).counter}",
                      style: TextStyle(
                          fontSize: 60,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      CounterCubit.getCounterCubit(context).plus();
                    },
                    child: Text(
                      "+",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.grey;
                          }
                        })),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
