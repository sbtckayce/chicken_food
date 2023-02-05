import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});
  static const String routeName='/order_confirmation';
  static Route route(){
    return MaterialPageRoute(builder: (_)=>OrderConfirmationScreen(),settings: RouteSettings(name: OrderConfirmationScreen.routeName));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}