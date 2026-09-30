import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF111827),
          ),
        ),
        title: Text(
          'Product Details',
          style: GoogleFonts.poppins(
            color: const Color(0xFF111827),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 260,
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              product.name,
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF111827),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price.toStringAsFixed(0)}',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1683F7),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.description,
              style: GoogleFonts.poppins(
                fontSize: 15,
                height: 1.6,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 24),
            _detailRow(
              'Brand',
              product.brand,
            ),
            const SizedBox(height: 12),
            _detailRow(
              'Category',
              product.category,
            ),
            const SizedBox(height: 12),
            _detailRow(
              'Stock',
              product.inStock ? 'In Stock' : 'Out of Stock',
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: product.inStock ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1683F7),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Add to Cart',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(
      String title,
      String value,
      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF111827),
          ),
        ),
      ],
    );
  }
}