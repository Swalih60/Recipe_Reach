import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_reach/components/favourite_card.dart';
import 'package:recipe_reach/components/profile_card.dart';
import 'package:recipe_reach/components/title_text.dart';
import 'package:recipe_reach/components/view_all_button.dart';
import 'package:recipe_reach/providers/product_provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            const ProfileCard(),
            const SizedBox(height: 16.0),

            // My Favorites Section
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText(text: "My Favorites"),
                ViewAllButton(),
              ],
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: productProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisExtent: 240),
                      scrollDirection: Axis.vertical,
                      itemCount: productProvider.products.length,
                      itemBuilder: (context, index) {
                        final product = productProvider.products[index];
                        return FavouriteCard(
                          description: product.description,
                          title: product.title,
                          imagePath: product.image,
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
