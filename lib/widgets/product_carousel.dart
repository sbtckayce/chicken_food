import 'package:emax/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    Key? key, required this.products,
  }) : super(key: key);
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 0 : 10),
            child: ProductCard(product: products[index],width: MediaQuery.of(context).size.width/2.5,isWishlist: false,));
        }),
        
      ),
    );
  }
}