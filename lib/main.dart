/*import 'package:flutter/material.dart';
import 'calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}*/

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _sum = 0;
  String _operation = "";
  bool _isDarkMode = true;

  void _addToSum(double value) {
    setState(() {
      _sum += value;
      _operation += value.toString() + " + ";
    });
  }

  void _resetSum() {
    setState(() {
      _sum = 0;
      _operation = "";
    });
  }

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        backgroundColor: _isDarkMode ? Color.fromARGB(255, 0, 0, 0) : Colors.grey[100],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total: $_sum',
              style: TextStyle(fontSize: 70),
            ),
            SizedBox(height: 20),
            Text(
              'Operation: $_operation',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [btncalc(1.25), btncalc(1.5), btncalc(1.75), btncalc(2)],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [btncalc(0.25), btncalc(0.5), btncalc(0.75), btncalc(1)],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetSum,
              child: Text('Reset'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _toggleDarkMode,
          child: Icon(_isDarkMode ? Icons.dark_mode : Icons.light_mode),
        ),
      ),
    );
  }

  Expanded btncalc(double vlu) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
          onPressed: () => _addToSum(vlu),
          child: Text(vlu.toString()),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 40, horizontal: 3)),
            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 40)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
