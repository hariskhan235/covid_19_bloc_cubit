import 'package:flutter/material.dart';

import '../../../covidstates/presentation/widgets/re_usable_row.dart';

class CovidCountryDetailsScreen extends StatelessWidget {
  final String name;
  final String image;
  final int active,
      totalCases,
      todayDeaths,
      deaths,
      recovered,
      critical,
      tests,
      todayRecovered;
  const CovidCountryDetailsScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.active,
      required this.totalCases,
      required this.todayDeaths,
      required this.deaths,
      required this.recovered,
      required this.critical,
      required this.tests,
      required this.todayRecovered});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .06,
            ),
            ReusableRow(
              title: 'Cases',
              value: totalCases.toString(),
            ),
            ReusableRow(
              title: 'Today Recovered',
              value: todayRecovered.toString(),
            ),
            ReusableRow(
              title: 'Total Recovered',
              value: recovered.toString(),
            ),
            ReusableRow(
              title: 'Deaths',
              value: deaths.toString(),
            ),
            ReusableRow(
              title: 'Critical',
              value: critical.toString(),
            ),
            ReusableRow(
              title: 'Active',
              value: active.toString(),
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(image),
            ),
          ],
        ),
      ),
    );
  }
}
