import 'package:emax/models/models.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable{
  final List<Product> products;
 const Cart({ this.products =const <Product>[]});
  
  double get subtotal => products.fold(0, (total, current) => total+ current.price);

  String get subtotalString => subtotal.toStringAsFixed(2);
  
  

  double  deliveryFee(subtotal){
    if(subtotal >=15.0){
      return 0.0;
    }else{
      return 10.0;
    }
  }
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String freeDelivery(subtotal){
    if(subtotal >=15.0){
      return 'You have FREE Delivery';
    }else{
      double missing = 15.0 -subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for FREE Delivery'
    ;}

  }
  String get freeDeliveryString => freeDelivery(subtotal);

   double total(subtotal,deliveryFee){
    return subtotal+ deliveryFee;

   }
  String get totalString => total(subtotal, deliveryFee(subtotal)).toStringAsFixed(2);
  
  
  Map productQuantity(products){
    var quantity = Map();
    products.forEach((product){
      if(!quantity.containsKey(product)){
        quantity[product] =1;
      }else{
        quantity[product] +=1;
      }
    });
    return quantity;
  }

  @override

  List<Object?> get props => [products];

}