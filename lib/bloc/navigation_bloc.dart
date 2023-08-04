import 'package:bloc/bloc.dart';
import './navigation_event.dart';
import './navigation_state.dart';
import './home_state.dart';
import './history_state.dart';
import './settings_state.dart';

// Define the bloc
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(HomeState());

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    switch (event) {
      case NavigationEvent.home:
        yield HomeState();
        break;
      case NavigationEvent.history:
        yield HistoryState();
        break;
      case NavigationEvent.settings:
        yield SettingsState();
        break;
    }  
  }
}
