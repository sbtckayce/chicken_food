
import 'package:emax/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/models.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      required this.product,
      required this.width,
      required this.isWishlist})
      : super(key: key);
  final Product product;
  final double width;
  final bool isWishlist;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: width,
            height: 150,
            child: Image.asset(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 60,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(color: Colors.black),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          '\$${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  isWishlist
                      ? BlocBuilder<WishlistBloc, WishlistState>(
                          builder: (context, state) {
                            return Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add, color: Colors.white)),
                                IconButton(
                                    onPressed: () {
                                      context
                                          .read<WishlistBloc>()
                                          .add(RemoveWishList(product));
                                      final snackBar = SnackBar(
                                          content: Text(
                                              'Removed to your Wishlist !'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    icon:
                                        Icon(Icons.delete, color: Colors.white))
                              ],
                            );
                          },
                        )
                      : Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
