import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'NewAnimation.dart';

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: AnimationTest(),
      routes: {
        //'firstscreen': (context) => MyAnimation(),
        "/secondscreen": (context) => SunAnimation()
      },
    );
  }
}

class AnimationTest extends StatefulWidget {
  @override
  _AnimationTestState createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest> {
  var _bigger = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Animation In Flutter'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: _bigger ? 100 : 500,
              child: Image.asset('assets/testanim.png'),
              duration: Duration(seconds: 1),
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      colors: [Colors.white, Colors.transparent])),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () => setState(() {
                _bigger = !_bigger;
              }),
              child: Text('Press'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/secondscreen");
        },
        child: Icon(Icons.touch_app),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
