import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/src/constant/theme.dart';
import 'package:weather/src/screen/botttom_bar/bottom_bar.dart';

void main() {
  runApp(const MyApp());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: Darktheme.theme ? ThemeMode.dark : ThemeMode.light,
      home: BottomBar()
    );
  }
}

