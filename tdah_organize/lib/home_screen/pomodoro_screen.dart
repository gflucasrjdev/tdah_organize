import 'package:flutter/material.dart';
import 'dart:async';

class PomodoroScreen extends StatefulWidget {
  @override
  _PomodoroScreenState createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  final int initialMinutes = 5;
  final int initialSeconds = 0;
  int _timeMinutes = 5;
  int _timeSeconds = 0;
  bool _isRunning = false;
  late Timer _timer;

  void _startTimer() {
    if (!_isRunning) {
      _isRunning = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (_timeSeconds == 0) {
            if (_timeMinutes == 0) {
              _timer.cancel();
              _isRunning = false;
            } else {
              _timeMinutes--;
              _timeSeconds = 59;
            }
          } else {
            _timeSeconds--;
          }
        });
      });
    } else {
      _timer.cancel();
      _isRunning = false;
    }
  }

  void _resetTimer() {
    if (_isRunning) {
      _timer.cancel();
      _isRunning = false;
    }
    setState(() {
      _timeMinutes = initialMinutes;
      _timeSeconds = initialSeconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: null,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hora de Focar',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            CircleAvatar(
              radius: 120.0,
              backgroundColor: Colors.grey[200],
              child: Text(
                '${_timeMinutes.toString().padLeft(2, '0')}:${_timeSeconds.toString().padLeft(2, '0')}',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ElevatedButton(
                      onPressed: _startTimer,
                      child: Text(_isRunning ? 'Pause' : 'Start'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple[400],
                        onPrimary: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ElevatedButton(
                      onPressed: _resetTimer,
                      child: Text('Reset'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple[400],
                        onPrimary: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/time_config');
                      },
                      child: Text('Config'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple[400],
                        onPrimary: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
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
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
