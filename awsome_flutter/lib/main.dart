import 'package:awsome_flutter/jiezhi/state/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => CountProvider())],
        child: MaterialApp(
            title: 'Flutter Demo',
            initialRoute: "/",
            onGenerateRoute: onGenerateRoute,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Tabs()));
  }
}
