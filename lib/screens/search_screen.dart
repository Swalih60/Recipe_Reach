import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_reach/components/category_chip.dart';
import 'package:recipe_reach/components/editors_choice_card.dart';
import 'package:recipe_reach/components/recipe_card.dart';
import 'package:recipe_reach/components/title_text.dart';
import 'package:recipe_reach/components/view_all_button.dart';
import 'package:recipe_reach/providers/product_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductProvider>();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Search',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Category Toggle Buttons
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
                children: [
                  TitleText(text: "Popular Recipes"),
                  ViewAllButton(),
                ],
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                height: 160.0,
                child: productProvider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productProvider.products.length,
                        itemBuilder: (context, index) {
                          final product = productProvider.products[index];
                          return RecipeCard(
                              title: product.title,
                              imagePath: product.image,
                              description: product.description);
                        },
                      ),
              ),
              const SizedBox(height: 16.0),

              // Editor's Choice Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(text: "Editor's Choice"),
                  ViewAllButton(),
                ],
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                height: 220,
                child: productProvider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: productProvider.products.length,
                        itemBuilder: (context, index) {
                          final product = productProvider.products[index];
                          return EditorsChoiceCard(
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

  //
}
