import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wathaker_application/screens/Counter/counter.dart';
import 'package:wathaker_application/screens/Duas/duas_screen.dart';
import 'package:wathaker_application/screens/Home/homepage.dart';
import 'package:wathaker_application/screens/Settings/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //LTR
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // Arabic
      ],
      theme: ThemeData(
        fontFamily: 'IBM Plex Sans Arabic',
      ),
      home: HomePage(),
      routes: {
        '/counter': (context) => Counter(),
        '/home': (context) => HomePage(),
        '/setting': (context) => Settings(),
        '/dua': (context) => DuasScreen(),
      },
    );
  }
}
