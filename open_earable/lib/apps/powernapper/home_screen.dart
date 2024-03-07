import 'package:flutter/material.dart';
import 'package:open_earable/apps/powernapper/timerscreen.dart';
import 'package:open_earable_flutter/src/open_earable_flutter.dart';

import 'interact.dart';

/// Homescreen class for the movement timer application.
class SleepHomeScreen extends StatefulWidget {
  final OpenEarable _openEarable;
  SleepHomeScreen(this._openEarable);
  @override
  _HomeScreenState createState() => _HomeScreenState(_openEarable);
}

/// State for the HomeScreenApplication.
///
/// Needs the [OpenEarable]-Object to interact.
class _HomeScreenState extends State<SleepHomeScreen> {
  final OpenEarable _openEarable;

  //Constructor
  _HomeScreenState(this._openEarable);

  //Bottom-Navigation-Bar index.
  int _currentIndex = 0;

  //Build main Widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Powernapper Alarm Clock'),
      ),

      //Body for the widget
      body: _getBody(),

      //Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        currentIndex: _currentIndex,
        onTap: _onNavBarItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      ),
    );
  }

  ///Body-Widget for Main Widget.
  Widget _getBody() {
    switch (_currentIndex) {
      case 0:

        //Timer Tab
        return TimerScreen(Interact(_openEarable));
      case 1:

        //Information Tab
        return Column(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Mit der Powernapping App können Sie einen Timer starten, der ganz '
                'automatisch an Ihren Bewegungen erkennt, wann Sie wirklich eingeschlafen sind. '
                'Der Timer wird automatisch restartet, wenn Sie sich bewegen, '
                'so können Sie effektiv powernappen und eine gemütliche Position finden '
                'ohne dass schon die Zeit abläuft!',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Diese Sub-App wurde entwickelt von: Philipp Ochs, Matrikelnummer 2284828',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        );

      default:

        //Default
        return Center(
          child: Text('Ungültiger Index'),
        );
    }
  }

  ///Navigation-Bar interaction
  ///
  /// [Index] is the tab index activated.
  void _onNavBarItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}