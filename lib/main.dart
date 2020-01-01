import 'package:flutter/material.dart';
import 'package:magic_8_ball/ui/ball_widget.dart';

void main() => runApp(
  MaterialApp(
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.lightBlue.shade300,
    ),
    home: Scaffold(
      body: Center(
        child: BallWidget(),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ),
);
