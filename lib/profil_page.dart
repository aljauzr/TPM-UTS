import 'package:flutter/material.dart';
import 'package:latihan_uts/profil_detail_page.dart';
import 'package:latihan_uts/welcome_page.dart';

import 'login_page.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Logout',
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
        title: const Text("Profil"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Color(0xFF282828),
              radius: 112,
              child: CircleAvatar(
                radius: 110,
                backgroundImage: AssetImage('images/jauzi.jpg'),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF282828))
              ),
              child: Text(
                  'Nama   : Al Jauzi Abdurrohman\n'
                  'NIM    : 123200106'
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 450,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailProfil()),
                  );
                },
                child: const Text("Detail Profil", style: TextStyle(fontSize: 17)),
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
