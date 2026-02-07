import 'package:flutter/material.dart';
import 'data/product_provider.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Initialize the provider at the root level so it persists
  final ProductProvider _productProvider = ProductProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Katalog',
      theme: ThemeData(
        // Using a modern color scheme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'Roboto', // Default, but explicit is nice
      ),
      // Define routes
      routes: {
        '/': (ctx) => const HomeScreen(),
        '/main': (ctx) => MainScreen(provider: _productProvider),
        '/catalog': (ctx) => MainScreen(
          provider: _productProvider,
        ), // Map catalog to MainScreen for backward compatibility if needed
        '/detail': (ctx) => ProductDetailScreen(provider: _productProvider),
      },
      // Fallback for unknown routes, though routes map usually covers it
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const HomeScreen());
      },
    );
  }
}
