import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  Product(
      {required this.id,
      required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular});

  @override
  List<Object?> get props =>
      [id, name, category, imageUrl, isRecommended, isPopular];

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        id: snap['id'],
        name: snap['name'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        price: snap['price'],
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular']);
    return product;
  }

  static List<Product> products = [
    Product(
      id: '1',
      name: 'Chicken 1',
      category: 'Chicken #1',
      imageUrl: 'assets/images/prod1.jpg',
      price: 10,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '2',
      name: 'Chicken 2',
      category: 'Chicken #1',
      imageUrl: 'assets/images/prod2.jpg',
      price: 6,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '3',
      name: 'Chicken 3',
      category: 'Chicken #2',
      imageUrl: 'assets/images/prod3.jpg',
      price: 5,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '4',
      name: 'Chicken 4',
      category: 'Chicken #2',
      imageUrl: 'assets/images/prod4.jpg',
      price: 6,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      id: '5',
      name: 'Chicken 5',
      category: 'Chicken #3',
      imageUrl: 'assets/images/prod5.jpg',
      price: 3,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      id: '6',
      name: 'Chicken 6',
      category: 'Chicken #3',
      imageUrl: 'assets/images/prod6.jpg',
      price: 4,
      isRecommended: true,
      isPopular: true,
    ),
  ];
}
