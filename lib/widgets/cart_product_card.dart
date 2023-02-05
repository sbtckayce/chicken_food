import 'package:emax/blocs/cart/cart_bloc.dart';
import 'package:emax/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({super.key, required this.product, required this.quantity});
  final Product product;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Image.asset(
            product.imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  '\$${product.price}',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(onPressed: () {
                    context.read<CartBloc>().add(RemoveCart(product));
                  }, icon: Icon(Icons.remove_circle)),
                  Text(
                    '${quantity}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  IconButton(onPressed: () {
                    context.read<CartBloc>().add(AddCart(product));

                  }, icon: Icon(Icons.add_circle)),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
