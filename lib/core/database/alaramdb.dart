import 'package:hive_flutter/hive_flutter.dart';
part 'alaramdb.g.dart';

@HiveType(typeId: 1)
class Alaramdb extends HiveObject {
  @HiveField(0)
  String time;

  @HiveField(1)
  String? label;

  @HiveField(2)
  bool isActive;

  Alaramdb({required this.time, this.label, required this.isActive});
}
