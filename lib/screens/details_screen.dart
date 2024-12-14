import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_reach/components/creator_tile.dart';
import 'package:recipe_reach/components/info_chip.dart';
import 'package:recipe_reach/components/ingredient_item.dart';
import 'package:recipe_reach/components/related_recipe_card.dart';
import 'package:recipe_reach/components/title_text.dart';
import 'package:recipe_reach/components/toggle_button.dart';
import 'package:recipe_reach/components/view_all_button.dart';
import 'package:recipe_reach/providers/product_provider.dart';

class DetailsScreen extends StatefulWidget {
  final String imagedata;
  final String title;
  final String description;

  const DetailsScreen({
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
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imagedata),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close)),
                  ),
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
                      icon: const Icon(Icons.favorite_border_outlined)),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 250),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      16, 24, 16, 24 + MediaQuery.of(context).padding.bottom),
                  decoration: const BoxDecoration(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              limitWords(widget.title, 2),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          buildInfoChip(Icons.access_time, '15 Min'),
                        ],
                      ),
                      const SizedBox(height: 8),
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
                      const SizedBox(height: 16),

                      // Info Chips
                      const Info(),
                      const SizedBox(height: 16),

                      // Ingredients & Instructions Tabs
                      ToggleButtonDesign(),
                      const SizedBox(height: 16),

                      // Ingredients List
                      const TitleText(text: "Ingredients"),
                      const SizedBox(height: 8),
                      Column(
                        children: [
                          buildIngredientItem('Tortilla Chips', '2'),
                          const SizedBox(
                            height: 10,
                          ),
                          buildIngredientItem('Avocado', '1'),
                          const SizedBox(
                            height: 10,
                          ),
                          buildIngredientItem('Red Cabbage', '9'),
                          const SizedBox(
                            height: 10,
                          ),
                          buildIngredientItem('Peanuts', '1'),
                          const SizedBox(
                            height: 10,
                          ),
                          buildIngredientItem('Red Onions', '1'),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Add To Cart Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(112, 185, 190, 1),
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Add To Cart',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Creator Section
                      const TitleText(text: "Creator"),
                      const CreatorTile(),
                      const SizedBox(height: 16),

                      // Related Recipes
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleText(text: "Related Recipes"),
                          ViewAllButton()
                        ],
                      ),
                      const SizedBox(height: 8),
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
                                  return RealtedRecipeCard(
                                      description: product.description,
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
    List<String> words = text.split(' ');
    if (words.length > wordLimit) {
      words = words.sublist(0, wordLimit);
      return '${words.join(' ')}...';
    } else {
      return text;
    }
  }
}
