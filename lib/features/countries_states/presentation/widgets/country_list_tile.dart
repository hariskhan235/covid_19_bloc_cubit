import 'package:flutter/material.dart';

class CountryListTile extends StatelessWidget {
  final String flag;
  final String country;
  final int cases;
  const CountryListTile(
      {super.key,
      required this.flag,
      required this.country,
      required this.cases});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          flag,
        ),
      ),
      title: Text(country),
      subtitle: Row(
        children: [
          const Text('Total Cases'),
          const SizedBox(
            width: 20,
          ),
          Text(
            cases.toString(),
          ),
        ],
      ),
    );
  }
}
