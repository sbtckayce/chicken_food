
import 'package:emax/blocs/wishlist/wishlist_bloc.dart';

import 'package:emax/models/models.dart';
import 'package:emax/widgets/custom_appbar.dart';
import 'package:emax/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => WishlistScreen(),
        settings: RouteSettings(name: WishlistScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isLeading: true,
        title: 'Wishlist',
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if(state is WishlistLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is WishlistLoaded){
            return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GridView.builder(
              
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2,
                 
                 ),
              itemCount:state.wishlist.products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ProductCard(
                    product: state.wishlist.products[index],
                    width: MediaQuery.of(context).size.width,
                    isWishlist: true,
                  ),
                );
              },
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
