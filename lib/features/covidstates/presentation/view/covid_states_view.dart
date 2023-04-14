import 'package:covid_19_api_bloc/features/covidstates/presentation/cubit/covid_states_cubit.dart';
import 'package:covid_19_api_bloc/features/covidstates/presentation/cubit/covid_states_state.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/re_usable_row.dart';

class CovidStatesView extends StatefulWidget {
  const CovidStatesView({super.key});

  @override
  State<CovidStatesView> createState() => _CovidStatesViewState();
}

class _CovidStatesViewState extends State<CovidStatesView>
    with TickerProviderStateMixin {
  late final AnimationController animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();

  @override
  void initState() {
    super.initState();
  }

  final colorList = <Color>[
    const Color.fromARGB(255, 79, 81, 226),
    const Color.fromARGB(255, 30, 154, 47),
    const Color.fromARGB(255, 237, 31, 12)
  ];

  @override
  Widget build(BuildContext context) {
    //BlocProvider.of<CovidStatesCubit>(context).fetchCovidStates();
    final size = MediaQuery.of(context).size;
    return BlocConsumer<CovidStatesCubit, CovidStates>(
        listener: (context, state) {
      if (state is CovidLoadedState) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Covid States Loaded'),
          ),
        );
      } else if (state is CovidErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Covid States Loading failed'),
          ),
        );
      }
    }, builder: (context, state) {
      if (state is CovidErrorState) {
        return Center(
          child: Text(state.message),
        );
      } else if (state is CovidLoadedState) {
        final covidStates = (state).covidStatesModel;
        return LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                PieChart(
                  chartValuesOptions: const ChartValuesOptions(
                      showChartValuesOutside: true,
                      chartValueBackgroundColor: Colors.amber,
                      decimalPlaces: 2,
                      showChartValuesInPercentage: true),
                  animationDuration: const Duration(milliseconds: 1200),
                  colorList: colorList,
                  legendOptions:
                      const LegendOptions(legendPosition: LegendPosition.top),
                  chartRadius: size.width / 3.2,
                  chartType: ChartType.ring,
                  dataMap: {
                    'Total': double.parse(covidStates.cases.toString()),
                    'Recovered': double.parse(
                      covidStates.recovered.toString(),
                    ),
                    'Deaths': double.parse(
                      covidStates.deaths.toString(),
                    ),
                  },
                ),
                SizedBox(
                  height: size.height * .05,
                ),
                ReusableRow(
                  title: 'Total',
                  value: covidStates.cases.toString(),
                ),
                ReusableRow(
                  title: 'Deaths',
                  value: covidStates.deaths.toString(),
                ),
                ReusableRow(
                  title: 'Active',
                  value: covidStates.active.toString(),
                ),
                ReusableRow(
                  title: 'Recovered',
                  value: covidStates.recovered.toString(),
                ),
                ReusableRow(
                  title: 'Critical',
                  value: covidStates.critical.toString(),
                ),
                ReusableRow(
                  title: 'Today Recoverd',
                  value: covidStates.todayRecovered.toString(),
                ),
                SizedBox(
                  height: size.height * .1,
                ),
              ],
            ),
          );
        });
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
