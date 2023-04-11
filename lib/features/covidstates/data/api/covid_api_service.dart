import 'dart:convert';

import 'package:covid_19_api_bloc/features/covidstates/domain/entities/covid_states_model.dart';
import 'package:http/http.dart' as http;

class CovidApiService {
  Future<CovidStatesModel> fetchCovidStates() async {
    try {
      final response = await http.get(
        Uri.parse(AppUrls.worldStatesApi),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return CovidStatesModel.fromJson(data);
      }
      return CovidStatesModel();

      // throw Exception('Error Occured While Recieving response');
    } catch (e) {
      return Future.error(e);
    }
  }
}

class AppUrls {
  static const String baseUrl = 'https://disease.sh/v3/covid-19/';

  static const String worldStatesApi = '${baseUrl}all';

  static const String countriesList = '${baseUrl}countries';
}
