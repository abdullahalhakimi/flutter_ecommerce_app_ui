import 'package:flutter_bloc/flutter_bloc.dart';

// Define navigation events
enum NavigationEvent { home, shop, bag, favorites, profile }

// Define navigation BLoC
class NavigationBloc extends Bloc<NavigationEvent, int> {
  NavigationBloc() : super(0);

  Stream<int> mapEventToState(NavigationEvent event) async* {
    switch (event) {
      case NavigationEvent.home:
        yield 0;
        break;
      case NavigationEvent.shop:
        yield 1;
        break;
      case NavigationEvent.bag:
        yield 2;
        break;
      case NavigationEvent.favorites:
        yield 3;
        break;
      case NavigationEvent.profile:
        yield 4;
        break;
    }
  }
}
