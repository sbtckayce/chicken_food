import 'package:bloc/bloc.dart';
import 'package:emax/models/models.dart';
import 'package:emax/models/wishlist_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishList>((event, emit) async {
      await Future<void>.delayed(Duration(seconds: 1));
      emit(WishlistLoaded());
    });
    on<AddWishList>((event, emit) {
      if (state is WishlistLoaded) {
        emit(WishlistLoaded(
            wishlist: Wishlist(
                products: List.from((state as WishlistLoaded).wishlist.products)
                  ..add(event.product))));
        print((state as WishlistLoaded).wishlist.products.length);
      }
    });
    on<RemoveWishList>((event, emit) {
      if (state is WishlistLoaded) {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from((state as WishlistLoaded).wishlist.products)
                ..remove(event.product),
            ),
          ),
        );
        print((state as WishlistLoaded).wishlist.products.length);
      }
    });
  }
}
