import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.grey,
        scaffoldBackgroundColor: Colors.grey[850]
    ),
    home: Scaffold(
      body: Container(),
    ),
    debugShowCheckedModeBanner: false,
  ),
);
