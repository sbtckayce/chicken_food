part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  WishlistEvent();
}

class StartWishList extends WishlistEvent {
  @override
  List<Object?> get props => [];
}

class AddWishList extends WishlistEvent {
  final Product product;

  AddWishList(this.product);
  @override
  List<Object?> get props => [product];
}

class RemoveWishList extends WishlistEvent {
  final Product product;

  RemoveWishList(this.product);
  @override
  List<Object?> get props => [product];
}
