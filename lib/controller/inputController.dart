
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class InputController extends GetxController{
  List<Map<String,dynamic>>  infodataList = [];
  final infolist =  Hive.box('infolist');
   @override
  void onInit() {
     fetchData();
    // TODO: implement onInit
    super.onInit();
  }


  void fetchData(){

    final data = infolist.keys.map((key) {
      final infoItem = infolist.get(key);
      return {"key":key,"name":infoItem["name"],"phone":infoItem["phone"],"email":infoItem["email"],"address":infoItem["address"]};
    }).toList();

    infodataList = data.reversed.toList();
    print(infodataList[0]["name"].toString());
  }

}