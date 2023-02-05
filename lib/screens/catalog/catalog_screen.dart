import 'package:emax/models/models.dart';
import 'package:emax/widgets/custom_appbar.dart';
import 'package:emax/widgets/custom_bottom_appbar.dart';
import 'package:emax/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key, required this.category});
  final Category category;
  static const String routeName='/catalog';
  static Route route({required Category category}){
    return MaterialPageRoute(builder: (_)=>CatalogScreen(category: category,),settings: RouteSettings(name: CatalogScreen.routeName));
  }
  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products.where((product) => product.category == category.name).toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name, isLeading: true),
      bottomNavigationBar: CustomBottomAppBar(),
     body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
       child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
       itemCount: categoryProducts.length,
        itemBuilder: (context,index){
         return  ProductCard(product: categoryProducts[index], width: MediaQuery.of(context).size.width/2,isWishlist: false,);
       }),
     ),
    );
  }
}