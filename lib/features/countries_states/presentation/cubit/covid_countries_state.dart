abstract class CovidCountriesStates {}

class CovidCountriesInitialState extends CovidCountriesStates {
  CovidCountriesInitialState();
}

class CovidCountriesLoadingState extends CovidCountriesStates {
  CovidCountriesLoadingState();
}

class CovidCountriesErrorState extends CovidCountriesStates {
  final String message;
  CovidCountriesErrorState(this.message);
}

class CovidCountriesLoadedState extends CovidCountriesStates {
  final List<dynamic> countriesStates;

  CovidCountriesLoadedState(this.countriesStates);
}
