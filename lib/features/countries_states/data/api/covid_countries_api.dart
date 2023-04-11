import 'dart:convert';
import 'package:http/http.dart' as http;

class CovidCountriesApiService {
  Future<List<dynamic>> countriesListApi() async {
    // ignore: prefer_typing_uninitialized_variables
    var data;
    final response = await http.get(
      Uri.parse(AppUrls.countriesList),
    );
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error Occured While Recieving response');
    }
  }
}

class AppUrls {
  static const String baseUrl = 'https://disease.sh/v3/covid-19/';

  static const String worldStatesApi = '${baseUrl}all';

  static const String countriesList = '${baseUrl}countries';
}
