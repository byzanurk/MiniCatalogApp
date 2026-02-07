import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/product_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductProvider provider;

  const ProductDetailScreen({super.key, required this.provider});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late String productId;
  late Product product;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve the productId from arguments
    productId = ModalRoute.of(context)!.settings.arguments as String;
    product = widget.provider.getById(productId);
  }

  @override
  Widget build(BuildContext context) {
    // Re-fetch to ensure we have latest state (isFavorite)
    product = widget.provider.getById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          IconButton(
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: product.isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                widget.provider.toggleFavorite(productId);
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (ctx, _, __) =>
                    const Center(child: Icon(Icons.error, size: 50)),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                '${product.price.toStringAsFixed(2)} ₺',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                product.description,
                textAlign: TextAlign.center,
                softWrap: true,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Sepete Ekle'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product.name} sepete eklendi!'),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'Geri Al',
                        onPressed: () {},
                      ),
                    ),
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
