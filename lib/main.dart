import 'package:flutter/material.dart';

import 'balls_page.dart';

void main() => runApp(
  MaterialApp(
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.grey,
        scaffoldBackgroundColor: Colors.blueGrey[850]
    ),
    home: Scaffold(
      body: BallsPage(),
    ),
    debugShowCheckedModeBanner: false,
  ),
);
