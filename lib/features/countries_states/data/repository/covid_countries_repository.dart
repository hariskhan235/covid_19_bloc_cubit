import '../api/covid_countries_api.dart';

class CovidCountriesStatesRepo {
  final CovidCountriesApiService covidApiService;

  CovidCountriesStatesRepo({required this.covidApiService});

  Future<List<dynamic>> fetchCovidCountriesStates() async {
    final covidStates = await covidApiService.countriesListApi();
    return covidStates;
  }
}
