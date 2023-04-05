import 'package:flutter/material.dart';
import 'package:latihan_uts/welcome_page.dart';
import 'br_trapesium_keliling_page.dart';
import 'br_trapesium_luas_page.dart';
import 'login_page.dart';

class Trapesium extends StatefulWidget {
  const Trapesium({Key? key}) : super(key: key);

  @override
  _TrapesiumState createState() => _TrapesiumState();
}

class _TrapesiumState extends State<Trapesium> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF282828),
        title: const Text("Bangun Datar - Trapesium"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/trapesium.png',
              height: 150,
            ),
            SizedBox(height: 25),
            SizedBox(
              width: 450,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrapesiumLuas()),
                  );
                },
                child: const Text("Hitung Luas", style: TextStyle(fontSize: 17)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 22),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  primary: Color(0xFF282828),
                ),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: 450,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrapesiumKeliling()),
                  );
                },
                child: const Text("Hitung Keliling", style: TextStyle(fontSize: 17)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 22),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  primary: Color(0xFF282828),
                ),
              ),
            ),
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
}
