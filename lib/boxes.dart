import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/model/hivedatamodel.dart';
class Boxes {
  static Box<HiveDataModel> getData()=>Hive.box<HiveDataModel>("newdatafromapi");

}