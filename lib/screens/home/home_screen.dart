import 'package:carousel_slider/carousel_slider.dart';
import 'package:emax/blocs/cateogry/category_bloc.dart';
import 'package:emax/blocs/product/product_bloc.dart';
import 'package:emax/models/category_model.dart';
import 'package:emax/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => HomeScreen(),
        settings: RouteSettings(name: HomeScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home',
        isLeading: false,
      ),
      bottomNavigationBar: CustomBottomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                        initialPage: 2,
                        enlargeStrategy: CenterPageEnlargeStrategy.height),
                    items: state.categories
                        .map((category) => HeroCarouselCard(category: category))
                        .toList(),
                  );
                } else {
                  return Text('Something went wrong');
                }
              },
            ),
            SectionTitle(title: 'RECOMENDED'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
               if(state is ProductLoading){
                return CircularProgressIndicator();
               }if(state is ProductLoaded){
                 return ProductCarousel(
                  products: Product.products
                      .where((product) => product.isRecommended)
                      .toList(),
                );
               }else{
                return Text('Something went wrong');
               }
              },
            ),
            SectionTitle(title: 'POPULAR'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
               if(state is ProductLoading){
                return CircularProgressIndicator();
               }if(state is ProductLoaded){
                 return ProductCarousel(
                  products: Product.products
                      .where((product) => product.isPopular)
                      .toList(),
                );
               }else{
                return Text('Something went wrong');
               }
              },
            ),
          ],
        ),
      ),
    );
  }
}
