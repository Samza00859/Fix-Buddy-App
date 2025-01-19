import 'package:flutter/material.dart';
import 'package:fixbuddy/page/Register.dart'; // เพิ่มการนำเข้าไฟล์ Register.dart

class Login extends StatefulWidget {
  final VoidCallback onLogin;

  const Login({super.key, required this.onLogin});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(16.0), // เว้นขอบ
          decoration: BoxDecoration(
            color: Colors.orange, // พื้นหลังสีส้ม
            borderRadius: BorderRadius.circular(8.0), // มุมโค้งมน
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'ชื่อผู้ใช้',
                  filled: true,
                  fillColor: Colors.white, // สีพื้นหลังของช่องกรอก
                  border: OutlineInputBorder(), // ขอบของช่องกรอก
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'รหัสผ่าน',
                  filled: true,
                  fillColor: Colors.white, // สีพื้นหลังของช่องกรอก
                  border: const OutlineInputBorder(), // ขอบของช่องกรอก
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                obscureText: _obscureText,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: widget.onLogin,
                child: const Text('เข้าสู่ระบบ'),
              ),
              const SizedBox(height: 20), // เพิ่มช่องว่างระหว่างปุ่ม
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Register(),
                    ),
                  );
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
