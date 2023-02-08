import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emax/blocs/cart/cart_bloc.dart';

import 'package:emax/models/models.dart';

import 'package:emax/repositories/checkout/checkout_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({
    required CartBloc cartBloc,
    required CheckoutRepository checkoutRepository,
  })  : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(
          cartBloc.state is CartLoaded
              ? CheckoutLoaded(
                  products: (cartBloc.state as CartLoaded).cart.products,
                  deliveryFee:
                      (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                  subtotal: (cartBloc.state as CartLoaded).cart.subtotalString,
                  total: (cartBloc.state as CartLoaded).cart.totalString,
                )
              : CheckoutLoading(),
        ) {
    _cartSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded)
        add(
          UpdateCheckout(cart: state.cart),
        );
    });
    on<UpdateCheckout>((event, emit) {
      if (state is CheckoutLoaded) {
        final state = this.state as CheckoutLoaded;
        emit(CheckoutLoaded(
          email: event.email ?? state.email,
          fullName: event.fullName ?? state.fullName,
          products: event.cart?.products ?? state.products,
          deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
          subtotal: event.cart?.subtotalString ?? state.subtotal,
          total: event.cart?.totalString ?? state.total,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          country: event.country ?? state.country,
          zipCode: event.zipCode ?? state.zipCode,
        ));
      }
    });
    on<ConfirmCheckout>((event, emit) async {
      if (state is CheckoutLoaded) {
        _checkoutSubscription?.cancel();
        try {
          await _checkoutRepository.addCheckout(event.checkout);
          print('Done');
          emit(CheckoutLoading());
        } catch (e) {}
      }
    });
  }
}
