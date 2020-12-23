//import 'dart:js';

import 'package:album/notifier/desc_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:album/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(MultiProvider(
      ChangeNotifierProvider(
        create: (context) => DescNotifier(),
      ),
    )),
    themeMode: ThemeMode.system,
    theme: ThemeData(
      brightness: Brightness.light,
      accentColor: Colors.blue,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.amber[700],
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MultiProvider {
  MultiProvider(ChangeNotifierProvider<DescNotifier> changeNotifierProvider);
}

class MyApp extends StatefulWidget {
  MyApp(MultiProvider multiProvider);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Auth();
  }
}
