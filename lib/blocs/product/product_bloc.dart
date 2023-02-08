import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emax/models/models.dart';
import 'package:emax/repositories/product/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on<LoadProduct>((event, emit) {
      _productSubscription?.cancel();
      _productSubscription =
          _productRepository.getAllProduct().listen((product) {
        return add(UpdateProduct(product));
      });
    });
     on<UpdateProduct>((event, emit) {
      emit(ProductLoaded(products: event.product));
    });
  }
}
