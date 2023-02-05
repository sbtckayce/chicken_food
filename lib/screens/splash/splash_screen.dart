import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName='/splash';
  static Route route(){
    return MaterialPageRoute(builder: (_)=>const SplashScreen(),settings: RouteSettings(name: SplashScreen.routeName));
  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1),()=>Navigator.pushNamed(context, '/'));
    return Scaffold(
     body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset('assets/images/splash.png',width: 125,height: 125,),
        ),
       const SizedBox(height: 30,),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black),child:  Text('Chicken Food',style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),),)
      ],
     ),
    );
  }
}