import 'package:bloc/bloc.dart';
import 'package:emax/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<StartCart>((event, emit) async {
      await Future.delayed(Duration(seconds: 1));
      emit(CartLoaded());
    });
    on<AddCart>((event, emit) {
      if (state is CartLoaded) {
        emit(CartLoaded(
            cart: Cart(
                products: List.from((state as CartLoaded).cart.products)
                  ..add(event.product))));
      }
    });
    on<RemoveCart>((event, emit) {
      if (state is CartLoaded) {
        emit(CartLoaded(
            cart: Cart(
                products: List.from((state as CartLoaded).cart.products)
                  ..remove(event.product))));
      }
    });
  }
}
