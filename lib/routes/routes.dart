import 'package:flutter/material.dart';
import 'package:statemanagement_program/routes/routes_name.dart';
import 'package:statemanagement_program/view/homeview/homenotescreen.dart';
import 'package:statemanagement_program/view/loginview/loginscreen.dart';

import '../view/addnotescreen/addnotesscreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const Homenotescreen());
      case RoutesName.addnotes:
        return MaterialPageRoute(builder: (BuildContext context) => const Addnotesscreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
