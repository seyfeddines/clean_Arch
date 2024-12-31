import 'package:clean_arch/features/presentation/Screens/Proudect_info.dart';
import 'package:clean_arch/features/presentation/Widgets/Card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class AnimatedProductGrid extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "title": "Sofa Set",
      "image": "images/ruslan-bardash-4kTbAMRAHtQ-unsplash.jpg",
      "shortDescription": "A comfortable and stylish sofa set.",
      "longDescription": "This sofa set is perfect for your living room, combining comfort and style. It includes a three-seater and two armchairs, each with premium quality upholstery and a modern design that will elevate your home decor.",
      "price": "\$599",
      "rating": 4.5,
      "reviews": 128,
    },
    {
      "title": "Dining Table",
      "image": "ruslan-bardash-4kTbAMRAHtQ-unsplash.jpg",
      "shortDescription": "Perfect for family meals and gatherings.",
      "longDescription": "This modern dining table features a sleek glass top supported by high-quality wood legs. It's ideal for hosting family meals, parties, and gatherings. The spacious design comfortably accommodates up to six people.",
      "price": "\$499",
      "rating": 4.8,
      "reviews": 230,
    },
    {
      "title": "Office Chair",
      "image": "images/ruslan-bardash-4kTbAMRAHtQ-unsplash.jpg",
      "shortDescription": "Ergonomic chair for your workspace.",
      "longDescription": "An ergonomic office chair designed for long hours of sitting. It comes with adjustable height, lumbar support, and smooth-rolling wheels. Perfect for anyone who spends long hours working at a desk.",
      "price": "\$199",
      "rating": 4.2,
      "reviews": 75,
    },
    {
      "title": "Bed Frame",
      "image": "images/ruslan-bardash-4kTbAMRAHtQ-unsplash.jpg",
      "shortDescription": "Modern bed frame with storage options.",
      "longDescription": "This bed frame combines modern design with functionality. It features built-in storage drawers, perfect for keeping your bedroom organized and clutter-free. Made with sturdy materials for long-lasting use.",
      "price": "\$349",
      "rating": 4.6,
      "reviews": 89,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,

          crossAxisSpacing: 8.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 1000),
            columnCount: 2,
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: Hero(tag: 'tag-1', child: InkWell(
                  onTap: (){
                    Get.to(()=>Proudect_details(product: product,));
                  },
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: AdvancedCardSwiper(height: 80,products: [{
                          "title": "Product 1",
                          "image": "images/ruslan-bardash-4kTbAMRAHtQ-unsplash.jpg",
                          "description": "This is the first product."
                          },
                            {
                              "title": "Product 2",
                              "image": "images/ruslan-bardash-4kTbAMRAHtQ-unsplash.jpg",
                              "description": "This is the second product."
                            },],),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['title']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                product['shortDescription']!,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),)
              ),
            ),
          );
        },
      ),
    );
  }
}
