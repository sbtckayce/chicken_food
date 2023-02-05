import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  static const String routeName='/checkout';
  static Route route(){
    return MaterialPageRoute(builder: (_)=>CheckoutScreen(),settings: RouteSettings(name: CheckoutScreen.routeName));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}