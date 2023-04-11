import 'package:covid_19_api_bloc/features/countries_states/presentation/view/covid_countries_view.dart';
import 'package:covid_19_api_bloc/features/covidstates/presentation/view/covid_states_view.dart';
import 'package:covid_19_api_bloc/features/dashboard/constants/nav_bar_items.dart';
import 'package:covid_19_api_bloc/features/dashboard/presentation/cubit/navigation_cubit.dart';
import 'package:covid_19_api_bloc/features/dashboard/presentation/cubit/navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
          if (state.items == NavBarItems.covidStates) {
            return const CovidStatesView();
          } else if (state.items == NavBarItems.countriesStates) {
            return const CovidCountriesStatesView();
          } else {
            return const Center(
              child: Text('Profile'),
            );
          }
        }),
        bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
          return NavigationBar(
            selectedIndex: state.index,
            onDestinationSelected: (value) => onItemSelected(value),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Covid States',
              ),
              NavigationDestination(
                icon: Icon(Icons.all_out),
                label: 'Countries',
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        }),
      ),
    );
  }

  void onItemSelected(int index) {
    final bloc = BlocProvider.of<NavigationCubit>(context);
    switch (index) {
      case 0:
        bloc.getNavBarItem(NavBarItems.covidStates);
        break;
      case 1:
        bloc.getNavBarItem(NavBarItems.countriesStates);
        break;
      case 2:
        bloc.getNavBarItem(NavBarItems.profile);
        break;
      default:
        throw Exception('No Item Found');
    }
  }
}
