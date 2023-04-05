import 'package:flutter/material.dart';
import 'package:latihan_uts/welcome_page.dart';

import 'login_page.dart';

class TrapesiumKeliling extends StatefulWidget {
  const TrapesiumKeliling({Key? key}) : super(key: key);

  @override
  _TrapesiumKelilingState createState() => _TrapesiumKelilingState();
}

class _TrapesiumKelilingState extends State<TrapesiumKeliling> {
  TextEditingController _number1Controller = TextEditingController();
  TextEditingController _number2Controller = TextEditingController();
  TextEditingController _number3Controller = TextEditingController();
  TextEditingController _number4Controller = TextEditingController();
  double _result = 0;

  void _hitungKeliling() {
    num sisi_a = double.tryParse(_number1Controller.text) ?? 0;
    num sisi_b = double.tryParse(_number2Controller.text) ?? 0;
    num sisi_c = double.tryParse(_number3Controller.text) ?? 0;
    num sisi_d = double.tryParse(_number4Controller.text) ?? 0;

    setState(() {
      _result = (sisi_a+sisi_b+sisi_c+sisi_d) as double;
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
        title: const Text("Menu Trapesium - Hitung Keliling"),
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
                labelText: "Sisi 1 (cm)",
              ),
            ),
            TextField(
              controller: _number2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Sisi 2 (cm)",
              ),
            ),
            TextField(
              controller: _number3Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Sisi 3 (cm)",
              ),
            ),
            TextField(
              controller: _number4Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Sisi 4 (cm)",
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _hitungKeliling,
                  child: const Text("Hitung Keliling"),
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
