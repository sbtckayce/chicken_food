import 'package:emax/blocs/cart/cart_bloc.dart';
import 'package:emax/models/models.dart';
import 'package:emax/widgets/cart_product_card.dart';
import 'package:emax/widgets/custom_appbar.dart';
import 'package:emax/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => CartScreen(),
        settings: RouteSettings(name: CartScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart', isLeading: true),
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Text(
                    'GO TO CHECKOUT',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                ),
              ],
            ),
          )),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if(state is CartLoading){
            return Center(child: CircularProgressIndicator(),);
          }if(state is CartLoaded){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.cart.freeDeliveryString,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(),
                                  elevation: 0),
                              child: Text(
                                'Add More Items',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.35,
                        child: ListView.builder(
                          itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                          itemBuilder: ((context, index) {
                         return  CartProductCard(product: state.cart.productQuantity(state.cart.products).keys.elementAt(index),
                         quantity:state.cart.productQuantity(state.cart.products).values.elementAt(index) ,);
                        })),
                      )
                     
                    ],
                  ),
                  OrderSummary()
                ],
              ),
            );
          }else{
            return Text('Something went wrong');
          }
        },
      ),
    );
  }
}
