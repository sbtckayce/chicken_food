import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl});

  @override
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap){
    Category category = Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  static List<Category> categories = [
    Category(name: 'Chicken #1', imageUrl: 'assets/images/cate1.jpg'),
    Category(
      name: 'Chicken #2',
      imageUrl: 'assets/images/cate2.jpg',
    ),
    Category(
      name: 'Chicken #3',
      imageUrl: 'assets/images/cate3.jpg',
    ),
  ];
}
