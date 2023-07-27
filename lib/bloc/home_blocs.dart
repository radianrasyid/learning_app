import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/bloc/home_events.dart';
import 'package:training_app/bloc/home_states.dart';

class HomeBlocs extends Bloc<HomeEvents, HomeStates> {
  HomeBlocs() : super(InitStates()) {
    on<Increment>((event, emit) {
      emit(HomeStates(counter: state.counter + 1));
    });

    on<Decrement>((event, emit) {
      emit(HomeStates(counter: state.counter - 1));
    });
  }
}
