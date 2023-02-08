import 'package:emax/blocs/cart/cart_bloc.dart';
import 'package:emax/blocs/cateogry/category_bloc.dart';
import 'package:emax/blocs/checkout/checkout_bloc.dart';
import 'package:emax/blocs/product/product_bloc.dart';
import 'package:emax/blocs/wishlist/wishlist_bloc.dart';
import 'package:emax/config/app_router.dart';
import 'package:emax/config/theme.dart';
import 'package:emax/repositories/category/category_repository.dart';
import 'package:emax/repositories/checkout/checkout_repository.dart';
import 'package:emax/repositories/product/product_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishList())),
        BlocProvider(create: (_) => CartBloc()..add(StartCart())),
        BlocProvider(
            create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(LoadCategories())),
        BlocProvider(
            create: (_) => ProductBloc(productRepository: ProductRepository())
              ..add(LoadProduct())),
        BlocProvider(
            create: (context) => CheckoutBloc(
                cartBloc: context.read<CartBloc>(),
                checkoutRepository: CheckoutRepository()))
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
