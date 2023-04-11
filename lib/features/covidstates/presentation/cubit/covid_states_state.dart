import 'package:covid_19_api_bloc/features/covidstates/domain/entities/covid_states_model.dart';

abstract class CovidStates {
  CovidStates();
}

class CovidInitialState extends CovidStates {}

class CovidLoadingState extends CovidStates {}

class CovidErrorState extends CovidStates {
  final String message;
  CovidErrorState(this.message);
}

class CovidLoadedState extends CovidStates {
  final CovidStatesModel covidStatesModel;

  CovidLoadedState(this.covidStatesModel);
}
