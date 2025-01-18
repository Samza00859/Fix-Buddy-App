import 'package:flutter/material.dart';

class list extends StatefulWidget {
  const list({super.key});

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  List data = ["AAA", "BBB", "CCC", "DDD", "EEE"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.orange,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          padding: const EdgeInsets.all(30),
          child: Text(data[index],
              style:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        );
      },
    );
  }
}
