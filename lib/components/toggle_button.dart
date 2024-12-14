import 'package:flutter/material.dart';

class ToggleButtonDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFE8ECF4), // Background color for toggle container
        borderRadius: BorderRadius.circular(25), // Curved container
      ),
      child: Row(
        children: [
          // Active Button (Ingredients)
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFF003D3D), // Active button color
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                'Ingredients',
                style: TextStyle(
                  color: Colors.white, // Active text color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Inactive Button (Instructions)
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Instructions',
                style: TextStyle(
                  color: Colors.black87, // Inactive text color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
