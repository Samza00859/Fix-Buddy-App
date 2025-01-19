import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _lineController = TextEditingController();
  bool _obscureText = true;
  String _userType = 'ผู้ใช้ทั่วไป';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'ชื่อผู้ใช้'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'อีเมล'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'รหัสผ่าน',
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
            ),
            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureText,
              decoration: const InputDecoration(labelText: 'ยืนยันรหัสผ่าน'),
            ),
            DropdownButton<String>(
              value: _userType,
              onChanged: (String? newValue) {
                setState(() {
                  _userType = newValue!;
                });
              },
              items: <String>['ผู้ใช้ทั่วไป', 'ร้านซ่อมรถ']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            if (_userType == 'ร้านซ่อมรถ') ...[
              const SizedBox(height: 20),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'เบอร์โทรศัพท์'),
              ),
              TextField(
                controller: _lineController,
                decoration: const InputDecoration(labelText: 'Line'),
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // เพิ่มฟังก์ชันการลงทะเบียนที่นี่
              },
              child: const Text('ลงทะเบียน'),
            ),
          ],
        ),
      ),
    );
  }
}
