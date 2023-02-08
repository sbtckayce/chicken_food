part of 'product_bloc.dart';


abstract class ProductEvent extends Equatable {
    @override
 
  List<Object?> get props => [];
}
class LoadProduct extends ProductEvent{

}
class UpdateProduct extends ProductEvent{
  final List<Product>product;

  UpdateProduct(this.product);
  
    @override
 
  List<Object?> get props => [product];
}