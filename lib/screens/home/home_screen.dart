import 'package:carousel_slider/carousel_slider.dart';
import 'package:emax/models/category_model.dart';
import 'package:emax/models/models.dart';
import 'package:flutter/material.dart';

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
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    initialPage: 2,
                    enlargeStrategy: CenterPageEnlargeStrategy.height),
                items: Category.categories
                    .map((category) => HeroCarouselCard(category: category))
                    .toList(),
              ),
            ),
            SectionTitle(title: 'RECOMENDED'),
            ProductCarousel(products: Product.products.where((product) => product.isRecommended).toList(),)
            , SectionTitle(title: 'POPULAR'),
            ProductCarousel(products: Product.products.where((product) => product.isPopular).toList(),)
          ],
        ),
      ),
    );
  }
}



