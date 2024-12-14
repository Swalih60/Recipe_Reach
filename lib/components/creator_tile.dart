import 'package:flutter/material.dart';

class CreatorTile extends StatelessWidget {
  const CreatorTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/login.jpeg'),
      ),
      title: Text(
        'Natalia Luca',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text('I’m the author and recipe developer.'),
    );
  }
}
