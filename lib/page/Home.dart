import 'package:flutter/material.dart';
import 'queue.dart'; // นำเข้าไฟล์ queue.dart
import 'contact.dart'; // นำเข้าไฟล์ contact.dart
import 'profile.dart'; // นำเข้าไฟล์ profile.dart

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 40, // กำหนดความกว้างของรูปภาพ
            height: 40, // กำหนดความสูงของรูปภาพ
            child: Image.asset(
                'assets/image/FixBuddy.png'), // เพิ่มรูปภาพที่ซ้ายสุด
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Profile(
                    username: 'ชื่อผู้ใช้', // แทนที่ด้วยข้อมูลจริง
                    email: 'email@example.com', // แทนที่ด้วยข้อมูลจริง
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white, // เปลี่ยนพื้นหลังเป็นสีขาว
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [
            ShopCard(
              name: 'ร้าน A',
              hours: '9:00 - 18:00',
              distance: '2 km',
              phone: '081-234-5678',
              line: '@fixbuddyA',
            ),
            SizedBox(height: 16.0),
            ShopCard(
              name: 'ร้าน B',
              hours: '10:00 - 19:00',
              distance: '3 km',
              phone: '082-345-6789',
              line: '@fixbuddyB',
            ),
          ],
        ),
      ),
    );
  }
}

class ShopCard extends StatefulWidget {
  final String name;
  final String hours;
  final String distance;
  final String phone;
  final String line;

  const ShopCard({
    super.key,
    required this.name,
    required this.hours,
    required this.distance,
    required this.phone,
    required this.line,
  });

  @override
  _ShopCardState createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange, // เปลี่ยนสีพื้นหลังเป็นสีส้ม
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text('เวลาทำการ: ${widget.hours}'),
            Text('ระยะทาง: ${widget.distance}'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isSelected = !_isSelected;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // สีพื้นหลังของปุ่ม
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('เลือก'),
            ),
            if (_isSelected) ...[
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Contact(
                        name: widget.name,
                        phone: widget.phone,
                        line: widget.line,
                      ),
                    ),
                  );
                },
                child: const Text('ติดต่อร้าน'),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Queue()),
                  );
                },
                child: const Text('จองคิว'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
