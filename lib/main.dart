import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_reach/components/bottom_navbar.dart';
import 'package:recipe_reach/providers/product_provider.dart';
import 'package:recipe_reach/screens/home_screen.dart';
import 'package:recipe_reach/screens/login_screen.dart';

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
        home: const LoginScreen(),
        title: "Recipe Reach",
        routes: {
          '/login': (context) => BottomNavBar(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
