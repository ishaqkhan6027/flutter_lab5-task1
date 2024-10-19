import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImplicitAnimation(),
    );
  }
}

class ImplicitAnimation extends StatefulWidget {
  @override
  _ImplicitAnimationState createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  // Variables for AnimatedContainer properties
  double _height = 100;
  double _width = 100;
  Color _color = Colors.blue;
  double _borderRadius = 8;

  // Boolean flag for AnimatedOpacity
  bool _isVisible = true;

  // Function to toggle container properties
  void _changeContainerProperties() {
    setState(() {
      _height = _height == 100 ? 200 : 100;
      _width = _width == 100 ? 200 : 100;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
      _borderRadius = _borderRadius == 8 ? 32 : 8;
    });
  }

  // Function to toggle visibility of text
  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Animations in Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedContainer for size, color, and border changes
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeContainerProperties,
              child: Text('Change Container Properties'),
            ),
            SizedBox(height: 40),
            // AnimatedOpacity for text visibility
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Text(
                'Assalam u Alaikum, Sir!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleVisibility,
              child: Text('Toggle Text Visibility'),
            ),
          ],
        ),
      ),
    );
  }
}
