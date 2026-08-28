import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_program/provider/provider.dart';
import 'package:statemanagement_program/routes/routes.dart';
import 'package:statemanagement_program/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Notesprovider())],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.cyan,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20
            )
          ),
           scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: RoutesName.home,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
