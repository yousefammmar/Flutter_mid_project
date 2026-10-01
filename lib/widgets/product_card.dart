import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/product_details/view_model/favorite_cubit.dart';
import '../screens/product_details/view_model/favorite_state.dart';
import '../models/product_model.dart';
import '../screens/product_details/view/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              product: product,
            ),
          ),
        );
      },
      child: Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlocBuilder<FavoriteCubit, ProductDetailsState>(
                    builder: (context, state) {
                      final cubit = context.read<FavoriteCubit>();
                      final isFavorite = cubit.isFavorite;

                      return IconButton(
                        onPressed: () {
                          cubit.toggleFavorite(product.name);
                        },
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isFavorite
                              ? Colors.red
                              : Colors.grey,
                        ),
                      );
                    },
                  ),
                ],
              ),

              Expanded(
                child: Center(
                  child: Image.asset(
                    product.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF111827),
                ),
              ),

              const SizedBox(height: 4),

              Text(
                '\$${product.price.toStringAsFixed(0)}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1683F7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}