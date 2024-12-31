
import 'package:clean_arch/features/presentation/Widgets/Card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class Proudect_details extends StatelessWidget{
  Proudect_details({required this.product});
final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 55),
        child: Column(
          children: [
            SizedBox(height: 35),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back, size: 30),
              ),
              title: Row(
                children: [
                  SizedBox(width: 220,),
                  InkWell(
                    child: LikeButton(
                    ),
                    onTap: (){},
                  ),
                ],
              )
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(flex: 1,child:Hero(tag: 'tag-1', child: AdvancedCardSwiper(height: 200,products: [{
            "title": "Product 1",
            "image": "images/ruslan-bardash-4kTbAMRAHtQ-unsplash.jpg",
            "description": "This is the first product."
          },
            {
              "title": "Product 2",
              "image": "images/ruslan-bardash-4kTbAMRAHtQ-unsplash.jpg",
              "description": "This is the second product."
            },

            ],),) ),
          Expanded(flex: 2,child: Column(
            children: [
              SizedBox(height: 30),
             Row(
               children: [
                 SizedBox(width: 20,),
                 Icon(Icons.star,color: Color(0xFFFD6B00),),
                 SizedBox(width: 5,),
                 Text('${product['rating']}',style: TextStyle(color: Color(0xFFFD6B00),fontSize: 18)),
                 SizedBox(width: 10,),
                 Container(
                   padding: EdgeInsets.all(9),
                   decoration: BoxDecoration(
                     color: Color(0xFFEBECEE),
                     borderRadius: BorderRadius.circular(11)
                   ),
                   child: Text('${product['reviews']} reviwes',style: TextStyle(),),
                 )
               ],
             ),
              Row(
                children: [
                  SizedBox(width: 9,height: 60,),
                  Text('${product['title']}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'Roberto'),)
                ],
              ),
              Wrap(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 9),
                    child: Text('${product['longDescription']}',style: TextStyle(fontSize: 15),),
                  )
                ],
              ),
              SizedBox(height: 160,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Text('${product['price']}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
                  SizedBox(width: 50,),
                  ElevatedButton(onPressed: (){}, child: Text('Add to card',style: TextStyle(color: Colors.white),)
                      ,style: ElevatedButton.styleFrom(
                        fixedSize: Size(170, 20),
                          backgroundColor: Colors.black))
                ],
              )
            ],
          ))
        ],
      ),
    );

  }

}