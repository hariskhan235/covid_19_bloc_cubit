import 'package:covid_19_api_bloc/features/countries_states/data/repository/covid_countries_repository.dart';
import 'package:covid_19_api_bloc/features/countries_states/presentation/cubit/covid_countries_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidCountriesCubit extends Cubit<CovidCountriesStates> {
  CovidCountriesCubit({required this.countriesStatesRepo})
      : super(
          CovidCountriesInitialState(),
        );
  final CovidCountriesStatesRepo countriesStatesRepo;

  Future<List<dynamic>> fetchCountriesStates() async {
    return await countriesStatesRepo
        .fetchCovidCountriesStates()
        .then((countriesStates) {
      emit(CovidCountriesLoadedState(countriesStates));
      return countriesStates;
    });
  }

  void onChanged(String value) {}
}
