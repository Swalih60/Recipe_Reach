import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_reach/components/category_chip.dart';
import 'package:recipe_reach/components/featured_card.dart';
import 'package:recipe_reach/components/popular_recipe_card.dart';
import 'package:recipe_reach/components/title_text.dart';
import 'package:recipe_reach/components/view_all_button.dart';
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

    context.read<ProductProvider>();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();

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
            const TitleText(text: "Featured"),
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
                        return buildFeaturedCard(
                            title: product.title,
                            time: product.price.toString(),
                            imagePath: product.image);
                      },
                    ),
            ),
            const SizedBox(height: 16.0),

            // Category Section
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [TitleText(text: "Category"), ViewAllButton()],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCategoryChip(
                    txtclr: Colors.white,
                    category: 'Breakfast',
                    clr: const Color.fromRGBO(112, 185, 190, 1)),
                buildCategoryChip(
                    txtclr: Colors.black,
                    category: 'Lunch',
                    clr: const Color.fromRGBO(241, 245, 245, 1)),
                buildCategoryChip(
                    txtclr: Colors.black,
                    category: 'Dinner',
                    clr: const Color.fromRGBO(241, 245, 245, 1)),
              ],
            ),
            const SizedBox(height: 16.0),

            // Popular Recipes Section
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [TitleText(text: "Popular Recipes"), ViewAllButton()],
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
                        return PopularRecipeCard(
                          description: product.description,
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
}
