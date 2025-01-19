import 'package:flutter/material.dart';
import 'package:fixbuddy/page/login.dart';
import 'package:fixbuddy/page/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fix Buddy',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isLoggedIn = false;

  void _login() {
    setState(() {
      _isLoggedIn = true;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // กำหนดความสูงของ AppBar
        child: AppBar(
          backgroundColor: Colors.orange,
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: 60, // กำหนดความกว้างของรูปภาพ
              height: 60, // กำหนดความสูงของรูปภาพ
              child: Image.asset(
                  'assets/image/FixBuddy.png'), // เพิ่มรูปภาพที่ซ้ายสุด
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white, // เปลี่ยนพื้นหลังเป็นสีขาว
        child: Navigator(
          onGenerateRoute: (RouteSettings settings) {
            Widget page;
            switch (settings.name) {
              case '/':
                page = _isLoggedIn ? const Home() : Login(onLogin: _login);
                break;
              default:
                page = _isLoggedIn ? const Home() : Login(onLogin: _login);
            }
            return MaterialPageRoute(builder: (context) => page);
          },
        ),
      ),
    );
  }
}
