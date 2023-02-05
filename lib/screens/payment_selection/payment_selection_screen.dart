import 'package:flutter/material.dart';

class PaymentSelectionScreen extends StatelessWidget {
  const PaymentSelectionScreen({super.key});
  static const String routeName='/payment_selection';
  static Route route(){
    return MaterialPageRoute(builder: (_)=>PaymentSelectionScreen(),settings: RouteSettings(name: PaymentSelectionScreen.routeName));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}