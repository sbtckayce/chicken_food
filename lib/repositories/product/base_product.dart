import 'package:emax/models/models.dart';

abstract class BaseProductRepository{
 Stream<List<Product>> getAllProduct();
}