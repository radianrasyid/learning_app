class HomeStates {
  int counter;

  HomeStates({required this.counter});
}

class InitStates extends HomeStates {
  InitStates() : super(counter: 0);
}
