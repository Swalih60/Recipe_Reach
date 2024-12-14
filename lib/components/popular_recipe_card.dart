import 'package:flutter/material.dart';
import 'package:recipe_reach/screens/details_screen.dart';

class PopularRecipeCard extends StatelessWidget {
  const PopularRecipeCard(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.description});

  final String title;
  final String imagePath;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
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
                      height: 120, // Adjust height

                      width: 128, // Match card width
                      fit: BoxFit.cover, // Ensure the image covers the space
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  // Text & Info section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow:
                          TextOverflow.ellipsis, // Ellipsis if text overflows
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          size: 16,
                          color: Color.fromRGBO(116, 129, 137, 1),
                        ),
                        Text(
                          "120 Kcal",
                          style: TextStyle(
                            color: Color.fromRGBO(116, 129, 137, 1),
                          ),
                        ),
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Color.fromRGBO(116, 129, 137, 1),
                        ),
                        Text(
                          "20 Min",
                          style: TextStyle(
                            color: Color.fromRGBO(116, 129, 137, 1),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
