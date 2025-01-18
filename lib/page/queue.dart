import 'package:flutter/material.dart';

class Queue extends StatelessWidget {
  final TextEditingController _licensePlateController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _issueController = TextEditingController();

  Queue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('จองคิวซ่อมรถ'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _licensePlateController,
              decoration: const InputDecoration(labelText: 'ทะเบียนรถ'),
            ),
            TextField(
              controller: _brandController,
              decoration: const InputDecoration(labelText: 'ยี่ห้อรถ'),
            ),
            TextField(
              controller: _modelController,
              decoration: const InputDecoration(labelText: 'รุ่นรถ'),
            ),
            TextField(
              controller: _colorController,
              decoration: const InputDecoration(labelText: 'สีรถ'),
            ),
            TextField(
              controller: _issueController,
              decoration: const InputDecoration(labelText: 'อาการของรถ'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // เพิ่มการทำงานเมื่อกดปุ่มจองคิว
              },
              child: const Text('จองคิว'),
            ),
          ],
        ),
      ),
    );
  }
}
