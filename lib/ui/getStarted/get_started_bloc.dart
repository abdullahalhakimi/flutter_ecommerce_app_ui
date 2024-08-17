import 'package:flutter_bloc/flutter_bloc.dart';


abstract class GetStartedEvent {}

class LoadGetStarted extends GetStartedEvent {}

abstract class GetStartedState {}

class SuccessLoaded extends GetStartedState {}

class GetStartedBloc extends Bloc<GetStartedEvent, GetStartedState> {
  GetStartedBloc() : super(SuccessLoaded()) {
    // Registering the event handler
    on<LoadGetStarted>((event, emit) {
      emit(SuccessLoaded());
    });
  }
}