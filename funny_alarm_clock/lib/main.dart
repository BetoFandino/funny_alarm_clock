import 'package:flutter/material.dart';

import 'home/ui/home.dart';

void main() => runApp(const AlarmApp());

class AlarmApp extends StatefulWidget {
  const AlarmApp({key});

  @override
  State<AlarmApp> createState() => _AlarmAppState();
}

class _AlarmAppState extends State<AlarmApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
    routes:  const {
        // add alarm
    },
    theme: ThemeData(
      fontFamily: 'SourceSansPro',
      primaryColor: const Color(0xff1B2c57), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff65D1BA))
    ),
    debugShowCheckedModeBanner: false,
    home: const Home(),
    );
  }
}