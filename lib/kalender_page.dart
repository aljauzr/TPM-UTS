import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latihan_uts/welcome_page.dart';

import 'login_page.dart';

enum Timezone { wib, wita, wit }

class Kalender extends StatefulWidget {
  @override
  _KalenderState createState() => _KalenderState();
}

class _KalenderState extends State<Kalender> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => WelcomePage()),
          ModalRoute.withName('/')
      );
    }
    if (_selectedIndex == 1) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          ModalRoute.withName('/')
      );
    }
  }

  Timezone _selectedTimezone = Timezone.wib;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF282828),
        title: const Text("Kalender"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('EEEE, d MMMM y').format(DateTime.now()),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            StreamBuilder<DateTime>(
              stream: Stream.periodic(Duration(seconds: 1), (_) => DateTime.now()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    _getTime(_selectedTimezone, snapshot.data!),
                    style: TextStyle(fontSize: 40),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: Timezone.wib,
                  groupValue: _selectedTimezone,
                  onChanged: (Timezone? value) {
                    setState(() {
                      _selectedTimezone = value!;
                    });
                  },
                ),
                Text('WIB'),
                Radio(
                  value: Timezone.wita,
                  groupValue: _selectedTimezone,
                  onChanged: (Timezone? value) {
                    setState(() {
                      _selectedTimezone = value!;
                    });
                  },
                ),
                Text('WITA'),
                Radio(
                  value: Timezone.wit,
                  groupValue: _selectedTimezone,
                  onChanged: (Timezone? value) {
                    setState(() {
                      _selectedTimezone = value!;
                    });
                  },
                ),
                Text('WIT'),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xFF282828),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
            backgroundColor: Color(0xFF282828),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF282828),
        onTap: _onItemTapped,
      ),
    );
  }

  String _getTime(Timezone timezone, DateTime now) {
    String timezoneAbbreviation = '';

    switch (timezone) {
      case Timezone.wib:
        timezoneAbbreviation = 'WIB';
        break;
      case Timezone.wita:
        now = now.add(Duration(hours: 1));
        timezoneAbbreviation = 'WITA';
        break;
      case Timezone.wit:
        now = now.add(Duration(hours: 2));
        timezoneAbbreviation = 'WIT';
        break;
    }

    String formattedTime = DateFormat('HH:mm:ss').format(now);

    return '$formattedTime $timezoneAbbreviation';
  }
}
