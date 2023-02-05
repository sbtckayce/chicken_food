
import 'package:emax/blocs/cart/cart_bloc.dart';
import 'package:emax/blocs/wishlist/wishlist_bloc.dart';
import 'package:emax/config/app_router.dart';
import 'package:emax/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> WishlistBloc()..add(StartWishList())),
        BlocProvider(create: (_)=>CartBloc()..add(StartCart()))
      ],
      
      child: MaterialApp(
        title: 'Chicken Food',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialRoute: '/splash',
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
