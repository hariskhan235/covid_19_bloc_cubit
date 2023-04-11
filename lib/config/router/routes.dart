import 'package:flutter/material.dart';

import '../../features/dashboard/presentation/views/dash_board.dart';

class AppRoutes {
  static appRoute() => [
        MaterialPageRoute(
          builder: (context) => const DashBoard(),
        ),
      ];
}
