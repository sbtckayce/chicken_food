part of 'cart_bloc.dart';


abstract class CartEvent  extends Equatable{
  CartEvent();
  @override
  
  List<Object?> get props => [];
}
class StartCart extends CartEvent{
   @override
  
  List<Object?> get props => [];

}
class AddCart extends CartEvent{
  final Product product;

  AddCart(this.product);
  
   @override
  
  List<Object?> get props => [product];
}
class RemoveCart extends CartEvent{
  final Product product;

  RemoveCart(this.product);
  
   @override
  
  List<Object?> get props => [product];
}