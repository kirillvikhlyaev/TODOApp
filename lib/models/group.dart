import 'package:hive/hive.dart';

part 'group.g.dart';

@HiveType(typeId: 1)
class Group {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final int tag;

  Group({required this.title, required this.description, required this.tag});
}
