import 'package:carousel_slider/carousel_slider.dart';
import 'package:emax/blocs/cart/cart_bloc.dart';

import 'package:emax/blocs/wishlist/wishlist_bloc.dart';
import 'package:emax/models/models.dart';
import 'package:emax/widgets/custom_appbar.dart';
import 'package:emax/widgets/hero_carousel_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});
  final Product product;
  static const String routeName = '/product';
  static Route route({required Product product}) {
    return MaterialPageRoute(
        builder: (_) => ProductScreen(
              product: product,
            ),
        settings: RouteSettings(name: ProductScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name, isLeading: true),
      body: ListView(children: [
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              initialPage: 2,
              enlargeStrategy: CenterPageEnlargeStrategy.height),
          items: [HeroCarouselCard(product: product)],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.bottomCenter,
                color: Colors.black.withAlpha(50)),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width - 10,
              height: 50,
              color: Colors.black,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          .headline5!
                          .copyWith(color: Colors.white),
                    )
                  ]),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ExpansionTile(
            initiallyExpanded: true,
            title: Text(
              'Product Infomation',
              style: Theme.of(context).textTheme.headline3,
            ),
            children: [
              ListTile(
                title: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s'),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ExpansionTile(
            title: Text(
              'Delivery Infomation',
              style: Theme.of(context).textTheme.headline3,
            ),
            children: [
              ListTile(
                title: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s'),
              )
            ],
          ),
        )
      ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: Colors.white,
              )),
          BlocBuilder<WishlistBloc, WishlistState>(
            builder: (context, state) {
              if (state is WishlistLoading) {
                return CircularProgressIndicator();
              }
              if (state is WishlistLoaded) {
                return IconButton(
                    onPressed: () {
                      context.read<WishlistBloc>().add(AddWishList(product));
                      final snackBar =
                          SnackBar(content: Text('Added to your Wishlist !'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ));
              } else {
                return Text('Something went wrong');
              }
            },
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if(state is CartLoading){
                return CircularProgressIndicator();
              }if(state is CartLoaded){
                return ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    context.read<CartBloc>().add(AddCart(product));
                    final snackBar = SnackBar(content: Text('Added to your Cart'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: Text(
                    'ADD TO CART',
                    style: Theme.of(context).textTheme.headline3,
                  ));
              }else{
                return Text('Something went wrong');
              }
            },
          )
        ]),
      ),
    );
  }
}
