import 'package:covid_19_api_bloc/features/covidstates/data/api/covid_api_service.dart';
import 'package:covid_19_api_bloc/features/covidstates/domain/entities/covid_states_model.dart';

class CovidStatesRepo {
  final CovidApiService covidApiService;

  CovidStatesRepo({required this.covidApiService});

  Future<CovidStatesModel> fetchCovidStates() async {
    final covidStates = await covidApiService.fetchCovidStates();
    return covidStates;
  }
}
