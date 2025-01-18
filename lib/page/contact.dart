import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  final String name;
  final String phone;
  final String line;

  const Contact({
    required this.name,
    required this.phone,
    required this.line,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลการติดต่อร้าน'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'ชื่อร้าน: $name',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'เบอร์โทรศัพท์: $phone',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Line: $line',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
