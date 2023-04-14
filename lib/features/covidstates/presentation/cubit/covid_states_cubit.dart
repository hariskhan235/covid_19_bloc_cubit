import 'package:bloc/bloc.dart';

import 'package:covid_19_api_bloc/features/covidstates/data/repository/covid_states_repository.dart';
import 'package:covid_19_api_bloc/features/covidstates/presentation/cubit/covid_states_state.dart';

class CovidStatesCubit extends Cubit<CovidStates> {
  final CovidStatesRepo repo;
  CovidStatesCubit({required this.repo})
      : super(
          CovidInitialState(),
        );

  Future<dynamic> fetchCovidStates() async {
    await repo.fetchCovidStates().then((covidStates) {
      emit(CovidLoadedState(covidStates));
    }).catchError((e) {
      emit(CovidErrorState(e.toString()));
    });
  }
}
