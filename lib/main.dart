import 'package:animation_app/home_page.dart';
import 'package:flutter/material.dart';

import 'NewAnimation.dart';

//import 'package:simple_staggered_animation/home_page.dart';
//import 'package:simple_animations/simple_animations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //initialRoute: 'firstscreen',
      home: MyAnimation(),

      //
    );
  }
}
