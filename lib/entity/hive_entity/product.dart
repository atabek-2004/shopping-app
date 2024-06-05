import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Products {
  @HiveField(1)
  final String productName;
  @HiveField(2)
  final String price;
  @HiveField(3)
  final int id;

  Products({required this.productName, required this.price, required this.id});
}
