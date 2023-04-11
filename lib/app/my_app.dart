import 'package:covid_19_api_bloc/features/countries_states/data/api/covid_countries_api.dart';
import 'package:covid_19_api_bloc/features/countries_states/data/repository/covid_countries_repository.dart';
import 'package:covid_19_api_bloc/features/countries_states/presentation/cubit/covid_countries_cubit.dart';
import 'package:covid_19_api_bloc/features/covidstates/data/api/covid_api_service.dart';
import 'package:covid_19_api_bloc/features/covidstates/data/repository/covid_states_repository.dart';
import 'package:covid_19_api_bloc/features/covidstates/presentation/cubit/covid_states_cubit.dart';
import 'package:covid_19_api_bloc/features/dashboard/presentation/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/dashboard/presentation/views/dash_board.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    CovidStatesRepo repo = CovidStatesRepo(
      covidApiService: CovidApiService(),
    );
    CovidCountriesStatesRepo countriesStatesRepo = CovidCountriesStatesRepo(
      covidApiService: CovidCountriesApiService(),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => CovidStatesCubit(
            repo: repo,
          ),
        ),
        BlocProvider(
          create: (context) => CovidCountriesCubit(
            countriesStatesRepo: countriesStatesRepo,
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DashBoard(),
      ),
    );
  }
}
