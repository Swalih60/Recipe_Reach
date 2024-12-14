import 'package:flutter/material.dart';

Widget buildInfoChip(IconData icon, String label) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.teal,
        size: 20,
      ),
      const SizedBox(width: 4),
      Text(label,
          style: const TextStyle(
            fontSize: 15,
          )),
    ],
  );
}

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildInfoChip(Icons.local_fire_department, '120 Kcal'),
              buildInfoChip(Icons.fitness_center, '27g proteins'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildInfoChip(Icons.local_fire_department, '120 Kcal'),
              buildInfoChip(Icons.fitness_center, '27g proteins'),
            ],
          ),
        ),
      ],
    );
  }
}
