import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_reach/providers/product_provider.dart';
import 'package:recipe_reach/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        title: "Recipe Reach",
      ),
    );
  }
}
