import 'package:flutter/material.dart';

class QuantityWidget extends StatefulWidget {
  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int index = 0;

  void _increment() {
    setState(() {
      index++;
    });
  }

  void _decrement() {
    if (index > 0) {  
      setState(() {
        index--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey), 
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: _increment,
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            '$index', 
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: _decrement,
            icon: Icon(
              Icons.remove, 
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
