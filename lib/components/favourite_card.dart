// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:recipe_reach/screens/details_screen.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
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
      height: 100,
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
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.network(
                          imagePath,
                          height: 110, // Adjust height

                          width: 132, // Match card width
                          fit:
                              BoxFit.cover, // Ensure the image covers the space
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.favorite_border_outlined)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  // Text & Info section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),

                          maxLines: 2,
                          overflow: TextOverflow
                              .ellipsis, // Ellipsis if text overflows
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        )
                      ],
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
