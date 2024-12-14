import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage('assets/images/login.jpeg'),
            ),
            const SizedBox(width: 16.0),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alena Sabyan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Recipe Developer',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(4, 38, 40, 1),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 16,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
