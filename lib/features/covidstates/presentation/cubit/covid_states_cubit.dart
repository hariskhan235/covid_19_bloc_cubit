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
    //emit(CovidLoadingState());
    await repo.fetchCovidStates().then((covidStates) {
      emit(CovidLoadedState(covidStates));
    }).catchError((e) {
      emit(CovidErrorState(e));
    });
  }
}

  // Future<CovidStatesModel> fetchCovidStates() async {
  //   try {
  //     emit(CovidLoadingState());
  //     final response = await http.get(
  //       Uri.parse(AppUrls.worldStatesApi),
  //     );
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);
  //       emit(CovidLoadedState(data));
  //       return CovidStatesModel.fromJson(data);
  //     } else {
  //       emit(CovidErrorState());
  //       throw Exception('Error Occured While Recieving response');
  //     }
  //   } catch (e) {
  //     emit(CovidErrorState());
  //     throw Exception('Error Occured While Recieving response');
  //   }
  // }

