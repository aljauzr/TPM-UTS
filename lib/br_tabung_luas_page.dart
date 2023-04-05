import 'package:flutter/material.dart';
import 'package:latihan_uts/welcome_page.dart';

import 'login_page.dart';

class TabungLuas extends StatefulWidget {
  const TabungLuas({Key? key}) : super(key: key);

  @override
  _TabungLuasState createState() => _TabungLuasState();
}

class _TabungLuasState extends State<TabungLuas> {
  TextEditingController _number1Controller = TextEditingController();
  TextEditingController _number2Controller = TextEditingController();
  double _result = 0;

  void _hitungLuas() {
    num jarijari = double.tryParse(_number1Controller.text) ?? 0;
    num tinggi = double.tryParse(_number2Controller.text) ?? 0;
    const double pi = 3.1415926535897932;

    setState(() {
      _result = 2*pi*jarijari*(jarijari+tinggi);
    });
  }

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
        title: const Text("Menu Tabung - Hitung Luas"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _number1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Jari-Jari (cm)",
              ),
            ),
            TextField(
              controller: _number2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Tinggi (cm)",
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _hitungLuas,
                  child: const Text("Hitung Luas"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF282828),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Hasil: $_result cm",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'images/tabung.png',
              height: 150,
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
