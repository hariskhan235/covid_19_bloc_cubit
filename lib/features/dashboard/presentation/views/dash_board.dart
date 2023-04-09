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
  //int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.items == NavBarItems.covidStates) {
          return const Center(
            child: Text('Covid States'),
          );
        } else if (state.items == NavBarItems.countriesStates) {
          return const Center(
            child: Text('Countries States'),
          );
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
              icon: Icon(Icons.settings),
              label: 'Countries',
            ),
            NavigationDestination(
              icon: Icon(Icons.play_circle_filled),
              label: 'Profile',
            ),
          ],
        );
      }),
    );
  }

  void onItemSelected(int index) {
    switch (index) {
      case 0:
        BlocProvider.of<NavigationCubit>(context)
            .getNavBarItem(NavBarItems.covidStates);
        break;
      case 1:
        BlocProvider.of<NavigationCubit>(context)
            .getNavBarItem(NavBarItems.countriesStates);
        break;
      case 2:
        BlocProvider.of<NavigationCubit>(context)
            .getNavBarItem(NavBarItems.profile);
        break;
      default:
        throw Exception('No Item Found');
    }
  }
}
