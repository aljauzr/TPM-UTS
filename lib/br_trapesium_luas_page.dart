import 'package:flutter/material.dart';
import 'package:latihan_uts/welcome_page.dart';

import 'login_page.dart';

class TrapesiumLuas extends StatefulWidget {
  const TrapesiumLuas({Key? key}) : super(key: key);

  @override
  _TrapesiumLuasState createState() => _TrapesiumLuasState();
}

class _TrapesiumLuasState extends State<TrapesiumLuas> {
  TextEditingController _number1Controller = TextEditingController();
  TextEditingController _number2Controller = TextEditingController();
  TextEditingController _number3Controller = TextEditingController();
  double _result = 0;

  void _hitungLuas() {
    num alas_atas = double.tryParse(_number1Controller.text) ?? 0;
    num alas_bawah = double.tryParse(_number2Controller.text) ?? 0;
    num tinggi = double.tryParse(_number3Controller.text) ?? 0;

    setState(() {
      _result = (1/2)*(alas_atas+alas_bawah)*tinggi;
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
        title: const Text("Menu Trapesium - Hitung Luas"),
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
                labelText: "Alas Atas (cm)",
              ),
            ),
            TextField(
              controller: _number2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Alas Bawah (cm)",
              ),
            ),
            TextField(
              controller: _number3Controller,
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
              'images/trapesium.png',
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
