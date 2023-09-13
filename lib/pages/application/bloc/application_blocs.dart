import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/pages/application/bloc/application_events.dart';
import 'package:training_app/pages/application/bloc/application_states.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationStates> {
  ApplicationBloc() : super(const ApplicationStates()) {
    on<PageEvent>(_pageEvent);
  }

  void _pageEvent(PageEvent event, Emitter<ApplicationStates> emit) {
    emit(state.copyWith(page: event.page));
  }
}
