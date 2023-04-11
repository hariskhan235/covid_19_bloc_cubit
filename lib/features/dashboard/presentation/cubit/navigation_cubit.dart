import 'package:bloc/bloc.dart';
import 'package:covid_19_api_bloc/features/dashboard/constants/nav_bar_items.dart';
import 'package:covid_19_api_bloc/features/dashboard/presentation/cubit/navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavBarItems.covidStates, 0));

  void getNavBarItem(NavBarItems navBarItems) {
    switch (navBarItems) {
      case NavBarItems.covidStates:
        emit(
          NavigationState(NavBarItems.covidStates, 0),
        );
        break;
      case NavBarItems.countriesStates:
        emit(
          NavigationState(NavBarItems.countriesStates, 1),
        );
        break;
      case NavBarItems.profile:
        emit(
          NavigationState(NavBarItems.profile, 2),
        );
        break;
      default:
        throw Exception('No Item Selected');
    }
  }
}
