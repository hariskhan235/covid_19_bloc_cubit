import 'package:covid_19_api_bloc/features/countries_states/presentation/cubit/covid_countries_cubit.dart';
import 'package:covid_19_api_bloc/features/countries_states/presentation/cubit/covid_countries_state.dart';
import 'package:covid_19_api_bloc/features/countries_states/presentation/view/covid_country_details_screen.dart';
import 'package:covid_19_api_bloc/features/countries_states/presentation/widgets/country_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidCountriesStatesView extends StatefulWidget {
  const CovidCountriesStatesView({super.key});

  @override
  State<CovidCountriesStatesView> createState() =>
      _CovidCountriesStatesViewState();
}

class _CovidCountriesStatesViewState extends State<CovidCountriesStatesView> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<CovidCountriesCubit>(context, listen: false)
    //     .fetchCountriesStates();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Search Country by Name',
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<CovidCountriesCubit, CovidCountriesStates>(
              listener: (context, state) {
                if (state is CovidCountriesErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error Loading Data'),
                    ),
                  );
                } else if (state is CovidCountriesLoadedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Data Loaded Successfully'),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is! CovidCountriesLoadedState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: state.countriesStates.length,
                    itemBuilder: (context, index) {
                      String countryName =
                          state.countriesStates[index]['country'];

                      if (searchController.text.isEmpty) {
                        return GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            //Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CovidCountryDetailsScreen(
                                    name: state.countriesStates[index]
                                        ['country'],
                                    image: state.countriesStates[index]
                                        ['countryInfo']['flag'],
                                    active: state.countriesStates[index]
                                        ['active'],
                                    totalCases: state.countriesStates[index]
                                        ['cases'],
                                    todayDeaths: state.countriesStates[index]
                                        ['todayDeaths'],
                                    deaths: state.countriesStates[index]
                                        ['deaths'],
                                    recovered: state.countriesStates[index]
                                        ['recovered'],
                                    critical: state.countriesStates[index]
                                        ['critical'],
                                    tests: state.countriesStates[index]
                                        ['tests'],
                                    todayRecovered: state.countriesStates[index]
                                        ['todayRecovered']),
                              ),
                            );
                          },
                          child: CountryListTile(
                            flag: state.countriesStates[index]['countryInfo']
                                ['flag'],
                            country: state.countriesStates[index]['country'],
                            cases: state.countriesStates[index]['cases'],
                          ),
                        );
                      } else if (countryName
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase())) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CovidCountryDetailsScreen(
                                      name: state.countriesStates[index]
                                          ['country'],
                                      image: state.countriesStates[index]
                                          ['countryInfo']['flag'],
                                      active: state.countriesStates[index]
                                          ['active'],
                                      totalCases: state.countriesStates[index]
                                          ['cases'],
                                      todayDeaths: state.countriesStates[index]
                                          ['todayDeaths'],
                                      deaths: state.countriesStates[index]
                                          ['deaths'],
                                      recovered: state.countriesStates[index]
                                          ['recovered'],
                                      critical: state.countriesStates[index]
                                          ['critical'],
                                      tests: state.countriesStates[index]
                                          ['tests'],
                                      todayRecovered:
                                          state.countriesStates[index]
                                              ['todayRecovered'],
                                    ),
                                  ),
                                );
                              },
                              child: CountryListTile(
                                flag: state.countriesStates[index]
                                    ['countryInfo']['flag'],
                                country: state.countriesStates[index]
                                    ['country'],
                                cases: state.countriesStates[index]['cases'],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
//   ListTile CountryListTile(CovidCountriesLoadedState state, int index) {
//     return ListTile(
//                             leading: CircleAvatar(
//                               backgroundImage: NetworkImage(
//                                 state.countriesStates[index]['countryInfo']
//                                         ['flag'] ??
//                                     '',
//                               ),
//                             ),
//                             title: Text(state.countriesStates[index]
//                                     ['country'] ??
//                                 ''),
//                             subtitle: Row(
//                               children: [
//                                 const Text('Total Cases'),
//                                 const SizedBox(
//                                   width: 20,
//                                 ),
//                                 Text(
//                                   state.countriesStates[index]['cases']
//                                       .toString(),
//                                 ),
//                               ],
//                             ),
//                           );
//   }
// }
