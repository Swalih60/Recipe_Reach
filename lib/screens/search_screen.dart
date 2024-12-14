import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_reach/providers/product_provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
      extendBody: true,
      appBar: AppBar(
        title: Text('Search',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // Category Toggle Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryButton('Breakfast', isSelected: true),
                  _buildCategoryButton('Lunch'),
                  _buildCategoryButton('Dinner'),
                ],
              ),
              SizedBox(height: 16.0),

              // Popular Recipes Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Recipes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style:
                            TextStyle(color: Color.fromRGBO(112, 185, 190, 1)),
                      )),
                ],
              ),
              SizedBox(height: 8.0),
              SizedBox(
                height: 160.0,
                child: productProvider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productProvider.products.length,
                        itemBuilder: (context, index) {
                          final product = productProvider.products[index];
                          return _buildRecipeCard(
                              title: product.title, imagePath: product.image);
                        },
                      ),
              ),
              SizedBox(height: 16.0),

              // Editor's Choice Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Editor's Choice",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style:
                            TextStyle(color: Color.fromRGBO(112, 185, 190, 1)),
                      )),
                ],
              ),
              SizedBox(height: 8.0),
              SizedBox(
                height: 220,
                child: productProvider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: productProvider.products.length,
                        itemBuilder: (context, index) {
                          final product = productProvider.products[index];
                          return _buildEditorsChoiceCard(
                            title: product.title,
                            imagePath: product.image,
                            description: product.description,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String text, {bool isSelected = false}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.black,
        backgroundColor: isSelected ? Colors.teal : Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(text),
    );
  }

  Widget _buildRecipeCard({required String title, required String imagePath}) {
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

  //

  Widget _buildEditorsChoiceCard(
      {required String title,
      required String imagePath,
      required String description}) {
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
                style: TextStyle(
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
                  onPressed: () {},
                  icon: Icon(
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
