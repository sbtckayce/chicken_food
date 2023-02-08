import 'package:emax/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return Column(
            children: [
              Divider(
                thickness: 2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SUBTOTAL',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text('\$${state.cart.subtotalString}',
                            style: Theme.of(context).textTheme.headline5)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'DELIVERY FEE',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text('\$${state.cart.deliveryFeeString}',
                            style: Theme.of(context).textTheme.headline5)
                      ],
                    )
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: Colors.black.withAlpha(50),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        width: MediaQuery.of(context).size.width - 10,
                        height: 50,
                        margin: EdgeInsets.all(5),
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'TOTAL',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              ),
                              Text('\$${state.cart.totalString}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: Colors.white))
                            ],
                          ),
                        )),
                  )
                ],
              )
            ],
          );
        } else {
          return Text('Something went wrong');
        }
      },
    );
  }
}
