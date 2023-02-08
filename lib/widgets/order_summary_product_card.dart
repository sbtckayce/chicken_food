import 'package:emax/models/models.dart';
import 'package:flutter/material.dart';

class OrderSummaryProductCard extends StatelessWidget {
  const OrderSummaryProductCard({
    Key? key, required this.product, required this.quantity,
  }) : super(key: key);
  final Product product;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Image.asset(
            product.imageUrl,
            fit: BoxFit.cover,
            height: 80,
            width: 100,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product.name}',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'Qty : ${quantity}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          Expanded(
            
             child:  Text(
                  '\$${product.price}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                
            ),
          
        ],
      ),
    );
  }
}
