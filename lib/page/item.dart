import 'package:flutter/material.dart';

class item extends StatefulWidget {
  const item({super.key});

  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  int quantity = 0;

  void addQuantity() {
    setState(() {
      quantity += 1;
    });
  }

  void minusQuantity() {
    setState(() {
      quantity = quantity <= 0 ? 0 : quantity - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$quantity",
              style:
                  const TextStyle(fontSize: 100, fontWeight: FontWeight.bold)),
          OutlinedButton(
              onPressed: () {
                addQuantity();
              },
              child: const Text(
                "+",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
          OutlinedButton(
              onPressed: () {
                minusQuantity();
              },
              child: const Text(
                "-",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
