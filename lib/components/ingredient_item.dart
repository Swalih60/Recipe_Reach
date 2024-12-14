import 'package:flutter/material.dart';

Widget buildIngredientItem(String name, String quantity) {
  return Material(
    elevation: 5,
    borderRadius: BorderRadius.circular(10),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/Image.png",
              height: 50,
              width: 50,
            ),
          ),
          Text(name, style: TextStyle(fontSize: 16)),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline, color: Colors.teal),
                onPressed: () {},
              ),
              Text(quantity, style: TextStyle(fontSize: 16)),
              IconButton(
                icon: Icon(Icons.add_circle_outline, color: Colors.teal),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
