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
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _sum = 0;
  double _maxSum = 20.0;
  bool _showMaxLimitWarning = false;
  String _operation = "";
  bool _isDarkMode = true;
  List<String> _savedCalculations = [];

  // Ad tracking variables
  int _fullScreenAdsWatched = 0;
  bool _adsDisabled = false;
  DateTime? _adsDisabledUntil;

  void _addToSum(double value) {
    if (_sum + value > _maxSum) {
      setState(() {
        _showMaxLimitWarning = true;
      });
      return;
    }
    setState(() {
      _showMaxLimitWarning = false;
      _sum += value;
      _operation += "$value + ";
    });
  }

  void _saveCalculation() {
    if (_operation.isNotEmpty) {
      String calculation = "$_operation = $_sum";
      setState(() {
        _savedCalculations.insert(0, calculation);
        if (_savedCalculations.length > 5) {
          _savedCalculations.removeLast();
        }
        _sum = 0;
        _operation = "";
        _showMaxLimitWarning = false;
      });
    }
  }

  void _resetSum() {
    setState(() {
      _sum = 0;
      _operation = "";
      _showMaxLimitWarning = false;
    });
  }

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _manageMaxSum() {
    TextEditingController _controller = TextEditingController(
      text: _maxSum.toString(),
    );
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: _isDarkMode ? Color(0xFF1F1F3F) : Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFF4F378A).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.speed_rounded,
                    size: 40,
                    color: Color(0xFF4F378A),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Set Maximum Sum",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: _isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Calculations exceeding this limit will trigger a warning.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: _isDarkMode ? Colors.white54 : Colors.black54,
                  ),
                ),
                SizedBox(height: 24.0),
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(
                    color: _isDarkMode ? Colors.white : Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: _isDarkMode
                        ? Color(0xFF2D2D4D)
                        : Color(0xFFF5F7FA),
                    hintText: "Enter value",
                    hintStyle: TextStyle(
                      color: _isDarkMode ? Colors.white30 : Colors.black26,
                      fontSize: 20,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Color(0xFF4F378A),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.0),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: _isDarkMode
                                ? Colors.white60
                                : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          double? newVal = double.tryParse(_controller.text);
                          if (newVal != null) {
                            setState(() {
                              _maxSum = newVal;
                            });
                          }
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4F378A),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          shadowColor: Color(0xFF4F378A).withOpacity(0.5),
                        ),
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _incrementFullScreenAds() {
    setState(() {
      _fullScreenAdsWatched++;
    });
  }

  void _watchAd() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            FullScreenAdPage(onAdWatched: _incrementFullScreenAds),
      ),
    );
  }

  void _disableAdsForWeek() {
    setState(() {
      _adsDisabled = true;
      _adsDisabledUntil = DateTime.now().add(Duration(days: 7));
      _fullScreenAdsWatched = 0;
    });
  }

  bool _shouldShowAds() {
    if (!_adsDisabled) return true;

    if (_adsDisabledUntil != null &&
        DateTime.now().isAfter(_adsDisabledUntil!)) {
      setState(() {
        _adsDisabled = false;
        _adsDisabledUntil = null;
      });
      return true;
    }

    return false;
  }

  List<Color> _getGradientColors() {
    double percent = _maxSum > 0 ? _sum / _maxSum : 0;

    if (percent >= 1.0) {
      // 100% or more: Green
      return [
        Color(0xFF66AA66).withOpacity(0.7),
        Color(0xFF88CC88).withOpacity(0.7),
      ];
    } else if (percent >= 0.75) {
      // 75% to < 100%: Yellow
      return [
        Color(0xFFBBBB55).withOpacity(0.7),
        Color(0xFFDDDD77).withOpacity(0.7),
      ];
    } else if (percent >= 0.50) {
      // 50% to < 75%: Orange
      return [
        Color(0xFFCC8855).withOpacity(0.7),
        Color(0xFFDD9966).withOpacity(0.7),
      ];
    } else {
      // < 50%: Red
      return [
        Color(0xFFBB6666).withOpacity(0.7),
        Color(0xFFCC8888).withOpacity(0.7),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _isDarkMode
                ? [Color(0xFF1A1A2E), Color(0xFF16213E)]
                : [Color(0xFFF5F7FA), Color(0xFFE8EEF5)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: _getGradientColors(),
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF4F378A).withOpacity(0.4),
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$_sum',
                            style: TextStyle(
                              fontSize: 88,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              //letterSpacing: 1,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.0),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '$_operation',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                                fontFamily: 'monospace',
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          if (_showMaxLimitWarning)
                            Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.warning_amber_rounded,
                                    color: Colors.redAccent,
                                    size: 20,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Limit Exceeded!',
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6),
                    // History Container
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        margin: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: _isDarkMode
                                ? [Color(0xFF2D2D4D), Color(0xFF1F1F3F)]
                                : [Colors.white, Color(0xFFF5F7FA)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFF4F378A).withOpacity(0.5),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF4F378A).withOpacity(0.15),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 3,
                                vertical: 3,
                              ),
                              child: Text(
                                'Calculations history (Last 5)',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4F378A),
                                ),
                              ),
                            ),
                            Expanded(
                              child: _savedCalculations.isEmpty
                                  ? Center(
                                      child: Text(
                                        'No saved calculations',
                                        style: TextStyle(
                                          color: _isDarkMode
                                              ? Colors.white54
                                              : Colors.black54,
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6,
                                      ),
                                      itemCount: _savedCalculations.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 4,
                                          ),
                                          child: Text(
                                            _savedCalculations[index],
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: _isDarkMode
                                                  ? Colors.white70
                                                  : Colors.black87,
                                              fontFamily: 'monospace',
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [btncalc(1.75), btncalc(2)],
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [btncalc(1.25), btncalc(1.5)],
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [btncalc(0.75), btncalc(1)],
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [btncalc(0.25), btncalc(0.5)],
                    ),
                    SizedBox(height: 6),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 138, 55, 55),
                            Color.fromARGB(255, 161, 91, 91),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF4F378A).withOpacity(0.3),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: _saveCalculation,
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 12,
                            ),
                            child: Text(
                              'Next !',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Developed by Mohammed NOR\n NOR It! ©',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 12,
                                color: _isDarkMode
                                    ? Colors.white70
                                    : Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FloatingActionButton(
                                  mini: true,
                                  onPressed: _manageMaxSum,
                                  child: Icon(Icons.settings),
                                ),
                                SizedBox(width: 8),
                                FloatingActionButton(
                                  mini: true,
                                  onPressed: _toggleDarkMode,
                                  child: Icon(
                                    _isDarkMode
                                        ? Icons.dark_mode
                                        : Icons.light_mode,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded btncalc(double vlu) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4F378A), Color(0xFF6B5BA1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF4F378A).withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _addToSum(vlu),
            borderRadius: BorderRadius.circular(12),
            child: Center(
              child: Text(
                vlu.toString(),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FullScreenAdPage extends StatefulWidget {
  final VoidCallback onAdWatched;

  const FullScreenAdPage({super.key, required this.onAdWatched});

  @override
  State<FullScreenAdPage> createState() => _FullScreenAdPageState();
}

class _FullScreenAdPageState extends State<FullScreenAdPage> {
  late int _remainingTime;
  late DateTime _startTime;

  @override
  void initState() {
    super.initState();
    _remainingTime = 10; // 10 second ad
    _startTime = DateTime.now();
    _startCountdown();
  }

  void _startCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _remainingTime--;
        });
        if (_remainingTime > 0) {
          _startCountdown();
        } else {
          _finishAd();
        }
      }
    });
  }

  void _finishAd() {
    widget.onAdWatched();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Prevent back button
      child: Scaffold(
        backgroundColor: Color(0xFF4F378A),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Advertisement',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 100,
                    color: Color(0xFF4F378A),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Amazing Product!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Get 50% off today',
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              SizedBox(height: 60),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'Skip in $_remainingTime',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4F378A),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
