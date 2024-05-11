import 'package:hive/hive.dart';
part 'hivedatamodel.g.dart';

@HiveType(typeId: 0)
class HiveDataModel extends HiveObject {
  @HiveField(0)
  late int UserID;
  @HiveField(1)
  late int id;
  @HiveField(2)
  late String title;
  @HiveField(3)
  late String body;
}
