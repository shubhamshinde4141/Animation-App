import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SunAnimation extends StatefulWidget {
  @override
  _SunAnimationState createState() => _SunAnimationState();
}

class _SunAnimationState extends State<SunAnimation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: SunAnimationTest(),
    );
  }
}

class SunAnimationTest extends StatefulWidget {
  @override
  _SunAnimationTestState createState() => _SunAnimationTestState();
}

class _SunAnimationTestState extends State<SunAnimationTest> {
  var _bigger = true;
  double _slidervalue = 0;
  Color _newColor = Colors.white;
  //static final colortween = ColorTween(begin: Colors.white, end: _newColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Animation In Flutter'),
      ),
      body: Stack(children: [
        Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  width: _bigger ? 100 : 300,
                  child: TweenAnimationBuilder(
                    tween: ColorTween(begin: Colors.white, end: _newColor),
                    duration: Duration(seconds: 1),
                    builder: (_, Color color, __) {
                      return ColorFiltered(
                        colorFilter:
                            ColorFilter.mode(color, BlendMode.modulate),
                        child: Image.asset('assets/verticlesun.jpg'),
                      );
                    },
                  ),
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
                ),
                SliderTheme(
                  data: SliderThemeData(
                      thumbColor: Colors.orange,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10)),
                  child: Slider.adaptive(
                      value: _slidervalue,
                      onChanged: (double value) {
                        setState(() {
                          _slidervalue = value;
                          _newColor = Color.lerp(
                              Colors.white, Colors.orange, _slidervalue);
                        });
                      }),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
