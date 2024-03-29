import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SmoothPageIndicatorDemo()
    );
  }
}

class SmoothPageIndicatorDemo extends StatefulWidget {
  @override
  _SmoothPageIndicatorDemoState createState() =>
      _SmoothPageIndicatorDemoState();
}

class _SmoothPageIndicatorDemoState extends State<SmoothPageIndicatorDemo> {
  final controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smooth Page Indicator Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: <Widget>[
                AnimatedContainer(height: 200,width: double.infinity,
                    duration: Duration(seconds: 2),color: Colors.blue),
                AnimatedContainer(height: 200,width: double.infinity,
                    duration: Duration(seconds: 2),color: Colors.red),
                AnimatedContainer(height: 200,width: double.infinity,
                    duration: Duration(seconds: 2),color: Colors.greenAccent),
                AnimatedContainer(height: 200,width: double.infinity,
                    duration: Duration(seconds: 2),color: Colors.yellow)
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: SlideEffect(
                    dotWidth: 16,
                    dotHeight: 16,
                    activeDotColor: Colors.teal,
                    dotColor: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
