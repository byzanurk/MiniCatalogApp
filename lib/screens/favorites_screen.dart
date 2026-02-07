import 'package:flutter/material.dart';
import '../data/product_provider.dart';
import '../widgets/product_item.dart';

class FavoritesScreen extends StatelessWidget {
  final ProductProvider provider;

  const FavoritesScreen({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    // We need to listen to provider changes to update the list
    return ListenableBuilder(
      listenable: provider,
      builder: (context, child) {
        final favoriteProducts = provider.products
            .where((p) => p.isFavorite)
            .toList();

        if (favoriteProducts.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 80,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 16),
                Text(
                  'Henüz favori ürününüz yok.',
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                ),
              ],
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            itemCount: favoriteProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (ctx, index) {
              final product = favoriteProducts[index];
              return ProductItem(
                product: product,
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushNamed('/detail', arguments: product.id);
                },
              );
            },
          ),
        );
      },
    );
  }
}
