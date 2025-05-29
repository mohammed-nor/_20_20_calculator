import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double _sum = 0.0;

  void _addToSum(double value) {
    setState(() {
      _sum += value;
    });
  }

  void _resetSum() {
    setState(() {
      _sum = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sum: $_sum',
            style: TextStyle(fontSize: 24.0),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildButton('0.25'),
              _buildButton('0.5'),
              _buildButton('0.75'),
              _buildButton('1'),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildButton('1.25'),
              _buildButton('1.5'),
              _buildButton('2'),
            ],
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _resetSum,
            child: Text('Reset Sum'),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _addToSum(double.parse(label)),
        child: Text(label),
      ),
    );
  }
}
