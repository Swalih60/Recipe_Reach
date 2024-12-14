import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_reach/components/toggle_button.dart';
import 'package:recipe_reach/providers/product_provider.dart';

class DetailsScreen extends StatefulWidget {
  final String imagedata;
  final String title;
  final String description;
  bool showIngredients = true;

  DetailsScreen({
    super.key,
    required this.imagedata,
    required this.title,
    required this.description,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Curved Image Background
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 250, // Adjust as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imagedata),
                    fit: BoxFit
                        .cover, // Ensures the image fills the container without distortion
                    alignment: Alignment.center, // Centers the image
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close)),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border_outlined)),
                ),
              ],
            ),
          ),

          // Content Positioned Over the Image
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 250), // Spacing to match image height
                Container(
                  padding: EdgeInsets.fromLTRB(
                      16, 24, 16, 24 + MediaQuery.of(context).padding.bottom),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and Subtitle
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              limitWords(widget.title, 3),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          _buildInfoChip(Icons.access_time, '15 Min'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          widget.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      ),
                      SizedBox(height: 16),

                      // Info Chips
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildInfoChip(
                                Icons.local_fire_department, '120 Kcal'),
                            _buildInfoChip(
                                Icons.fitness_center, '27g proteins'),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildInfoChip(
                                Icons.local_fire_department, '120 Kcal'),
                            _buildInfoChip(
                                Icons.fitness_center, '27g proteins'),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),

                      // Ingredients & Instructions Tabs
                      ToggleButtonDesign(),
                      SizedBox(height: 16),

                      // Ingredients List
                      Text(
                        'Ingredients',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Column(
                        children: [
                          _buildIngredientItem('Tortilla Chips', '2'),
                          const SizedBox(
                            height: 10,
                          ),
                          _buildIngredientItem('Avocado', '1'),
                          const SizedBox(
                            height: 10,
                          ),
                          _buildIngredientItem('Red Cabbage', '9'),
                          const SizedBox(
                            height: 10,
                          ),
                          _buildIngredientItem('Peanuts', '1'),
                          const SizedBox(
                            height: 10,
                          ),
                          _buildIngredientItem('Red Onions', '1'),
                        ],
                      ),
                      SizedBox(height: 16),

                      // Add To Cart Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(112, 185, 190, 1),
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Add To Cart',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 24),

                      // Creator Section
                      _buildSectionHeader('Creator'),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/login.jpeg'),
                        ),
                        title: Text(
                          'Natalia Luca',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('I’m the author and recipe developer.'),
                      ),
                      SizedBox(height: 16),

                      // Related Recipes
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildSectionHeader('Related Recipes'),
                          Text(
                            'See All',
                            style: TextStyle(
                                color: Color.fromRGBO(112, 185, 190, 1)),
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 160.0,
                        child: productProvider.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productProvider.products.length,
                                itemBuilder: (context, index) {
                                  final product =
                                      productProvider.products[index];
                                  return _buildRelatedRecipeCard(
                                      title: product.title,
                                      imagePath: product.image);
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String limitWords(String text, int wordLimit) {
    List<String> words = text.split(' '); // Split the text into words
    if (words.length > wordLimit) {
      words =
          words.sublist(0, wordLimit); // Take only the first `wordLimit` words
      return words.join(' ') + '...'; // Join the words back and add ellipsis
    } else {
      return text; // Return the original text if it's within the limit
    }
  }

  // Custom Shape for Top Curved Image
  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.teal),
        SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildIngredientItem(String name, String quantity) {
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

  Widget _buildRelatedRecipeCard(
      {required String title, required String imagePath}) {
    return SizedBox(
      width: 130,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
    );
  }
}

// Custom Clipper for Curved Image

