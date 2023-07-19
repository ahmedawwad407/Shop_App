abstract class CounterStates{}

class CounterInitialStates extends CounterStates{}

class CounterMinusStates extends CounterStates{

  final int counter;

  CounterMinusStates(this.counter);
}

class CounterPlusStates extends CounterStates{

  final int counter;

  CounterPlusStates(this.counter);
}