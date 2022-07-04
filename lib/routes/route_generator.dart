import 'package:flutter/material.dart';
import 'package:flutter_beginner/page/add_page.dart';
import 'package:flutter_beginner/page/home_page.dart';
import 'package:flutter_beginner/routes/name_routes.dart';

import '../page/error_page.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NameRoutes.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case NameRoutes.addPage:
        return MaterialPageRoute(
          builder: (context) => const AddPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        );
    }
  }
}
