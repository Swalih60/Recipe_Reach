import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_reach/providers/product_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch products on screen load
    final productProvider = context.read<ProductProvider>();
    productProvider.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lascade App'),
      ),
      body: context.watch<ProductProvider>().isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: context.watch<ProductProvider>().products.length,
              itemBuilder: (context, index) {
                final product = productProvider.products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  leading: Image.network(product.image),
                );
              },
            ),
    );
  }
}
