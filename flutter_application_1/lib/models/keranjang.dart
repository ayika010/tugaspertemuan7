import 'package:hive/hive.dart';
import 'package:flutter_application_1/screens/Home/addscreen.dart';
part 'keranjang2.dart';

@HiveType(typeId: 0)
class Keranjang extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  Keranjang({
    required this.title,
    required this.description,
  });
}
