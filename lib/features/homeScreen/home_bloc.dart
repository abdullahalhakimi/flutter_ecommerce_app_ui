import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FashionEvent {}

class LoadFashionData extends FashionEvent {}

abstract class FashionState {}

class FashionLoading extends FashionState {}

class FashionLoaded extends FashionState {
  final List<String> newItems;

  FashionLoaded(this.newItems);
}

class FashionError extends FashionState {}

class FashionBloc extends Bloc<FashionEvent, FashionState> {
  FashionBloc() : super(FashionLoading()) {
    on<LoadFashionData>(_onLoadFashionData);
  }

  void _onLoadFashionData(LoadFashionData event, Emitter<FashionState> emit) {
    // Simulate loading data
    final newItems = [
      'https://via.placeholder.com/100',
      'https://via.placeholder.com/100',
      'https://via.placeholder.com/100',
    ];

    emit(FashionLoaded(newItems));
  }
}