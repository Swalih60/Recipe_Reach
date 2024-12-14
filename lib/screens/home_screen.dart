import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_reach/providers/product_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    print(productProvider.products);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset("assets/images/Group.png"),
            const SizedBox(width: 8.0),
            const Text(
              'Good Morning',
              style: TextStyle(
                color: Color.fromRGBO(10, 37, 51, 1),
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Image.asset("assets/images/Buy.png"),
              ))
        ],
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Text
            const Text(
              'Alena Sabyan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0),

            // Featured Section
            const Text(
              'Featured',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              height: 150.0,
              child: productProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productProvider.products.length,
                      itemBuilder: (context, index) {
                        final product = productProvider.products[index];
                        return _buildFeaturedCard(
                            title: product.title,
                            time: product.price.toString(),
                            imagePath: product.image);
                      },
                    ),
            ),
            const SizedBox(height: 16.0),

            // Category Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Category',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(color: Colors.teal, fontSize: 14),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryChip(
                    txtclr: Colors.white,
                    category: 'Breakfast',
                    clr: const Color.fromRGBO(112, 185, 190, 1)),
                _buildCategoryChip(
                    txtclr: Colors.black,
                    category: 'Lunch',
                    clr: const Color.fromRGBO(241, 245, 245, 1)),
                _buildCategoryChip(
                    txtclr: Colors.black,
                    category: 'Dinner',
                    clr: const Color.fromRGBO(241, 245, 245, 1)),
              ],
            ),
            const SizedBox(height: 16.0),

            // Popular Recipes Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Recipes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(color: Colors.teal, fontSize: 14),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 240.0,
              child: productProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productProvider.products.length,
                      itemBuilder: (context, index) {
                        final product = productProvider.products[index];
                        return _buildPopularRecipeCard(
                          imagePath: product.image,
                          title: product.description,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedCard(
      {required String title,
      required String time,
      required String imagePath}) {
    return Container(
      width: 250.0,
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/bg.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 4.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              imagePath,
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("James Spader",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("20 Min",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white)),
                        ],
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

  Widget _buildCategoryChip(
      {required String category, required Color clr, required Color txtclr}) {
    return Container(
      height: 41,
      width: 119,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Text(
        category,
        style: TextStyle(color: txtclr),
      ),
    );
  }

  Widget _buildPopularRecipeCard(
      {required String title, required String imagePath}) {
    return SizedBox(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
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
    );
  }
}
