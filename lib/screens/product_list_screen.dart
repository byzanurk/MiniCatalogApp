import 'package:flutter/material.dart';
import '../data/product_provider.dart';
import '../widgets/product_item.dart';

// Assuming we pass the provider down or use InheritedWidget/Provider package.
// For this simple app without external packages, I'll pass the provider instance or make it a singleton/global in main.
// To keep it simple and clean without 'provider' package, I will accept the provider in constructor or find it.
// Let's rely on passing arguments or a crude global "state" manager for simplicity in this "Educational" context
// where extra packages are forbidden.

// Actually, I can wrap the App in an InheritedWidget, but that might be advanced for "Day 3/4".
// Let's use a singleton for the Data or just pass the list.
// BETTER: I'll make the ProductProvider a singleton for simplicity here.

class ProductListScreen extends StatefulWidget {
  final ProductProvider provider;

  const ProductListScreen({super.key, required this.provider});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    // Listen to changes to redraw when favorites change
    widget.provider.addListener(_onDataChanged);
  }

  @override
  void dispose() {
    widget.provider.removeListener(_onDataChanged);
    super.dispose();
  }

  void _onDataChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final products = widget.provider.products;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          final product = products[index];
          return ProductItem(
            product: product,
            onTap: () {
              Navigator.of(context).pushNamed('/detail', arguments: product.id);
            },
          );
        },
      ),
    );
  }
}
