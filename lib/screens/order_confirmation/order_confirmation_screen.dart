import 'package:emax/models/product_model.dart';
import 'package:emax/widgets/custom_bottom_appbar.dart';
import 'package:emax/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});
  static const String routeName='/order-confirmation';
  static Route route(){
    return MaterialPageRoute(builder: (_)=>OrderConfirmationScreen(),settings: RouteSettings(name: OrderConfirmationScreen.routeName));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text('Order Confirmation',style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CustomBottomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 300,width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset('assets/images/order-now.png',width: 150,height: 150,fit: BoxFit.cover,),
              Text('Your order is complete !', style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),)
            ],)),
          
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi : #123',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Thank you for purchasing on ChickenFood',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ORDER CODE : #123',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OrderSummary(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ORDER DETAILS',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      OrderSummaryProductCard(
                      product: Product.products[0],
                      quantity: 2,
                    ),
                    OrderSummaryProductCard(
                      product: Product.products[2],
                      quantity: 3,
                    )
                    ],
                  )
                ],
              ),
            )
          ],
      
        ),
      ),
    );
  }
}