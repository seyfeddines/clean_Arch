import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class AdvancedCardSwiper extends StatelessWidget {
  AdvancedCardSwiper({required this.height,required this.products});
  double height;
  final List<Map<String, String>> products ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Swiper(
        itemCount: products.length,
        itemWidth: 70,
        layout: SwiperLayout.DEFAULT,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                products[index]['image']!,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        autoplay: true,
        autoplayDelay: 10000,
        pagination: SwiperPagination(),

      ),
    );
  }
}
