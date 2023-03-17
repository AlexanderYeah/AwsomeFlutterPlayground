import 'package:flutter/material.dart';
import './tabs/tab.dart';
import './routers/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: "/",
        onGenerateRoute: onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Tabs());
  }
}
