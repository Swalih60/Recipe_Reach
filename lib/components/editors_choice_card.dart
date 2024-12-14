// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:recipe_reach/screens/details_screen.dart';

class EditorsChoiceCard extends StatelessWidget {
  const EditorsChoiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  final String title;
  final String description;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 130,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 4, // Elevation for shadow effect
          borderRadius: BorderRadius.circular(12),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // Rounded corners
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imagePath,
                height: 100, // Adjust height

                width: 70, // Match card width
                fit: BoxFit.cover, // Ensure the image covers the space
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            subtitle: Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(imagePath),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "Swalih",
                  style: TextStyle(
                    color: Color.fromRGBO(151, 162, 176, 1),
                  ),
                ),
              ],
            ),
            trailing: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(4, 38, 40, 1),
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                              imagedata: imagePath,
                              title: title,
                              description: description),
                        ));
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 16,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
