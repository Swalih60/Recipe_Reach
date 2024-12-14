// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:recipe_reach/screens/details_screen.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
  });

  final String title;
  final String imagePath;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                      imagedata: imagePath,
                      title: title,
                      description: description),
                ));
          },
          child: Card(
            color: Colors.white,
            elevation: 4, // Creates the shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Image section
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      imagePath,
                      height: 80, // Adjust height

                      width: 80, // Match card width
                      fit: BoxFit.cover, // Ensure the image covers the space
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  // Text & Info section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 1,

                      overflow:
                          TextOverflow.ellipsis, // Ellipsis if text overflows
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
