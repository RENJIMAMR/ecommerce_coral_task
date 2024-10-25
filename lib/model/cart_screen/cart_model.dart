import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  String? des;

  @HiveField(2)
  num price;

  @HiveField(3)
  String? image;

  @HiveField(4)
  int qty;

  @HiveField(5)
  int? id;

  CartModel({
    this.des,
    this.id,
    this.qty = 0,
    this.image,
    required this.price,
    required this.title,
  });
}
