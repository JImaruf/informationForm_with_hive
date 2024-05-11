
import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:notesapp/boxes.dart';
import 'package:notesapp/model/demoapiModel.dart';
import 'package:notesapp/model/hivedatamodel.dart';


class InputController extends GetxController{
  List<Map<String,dynamic>>  infodataList = [];
  List<DemoInfoApi> apiDataList = [];
  List<HiveDataModel>dataListfromApitoHive = [];

  final infolist =  Hive.box('infolist');

   @override
  void onInit() {
     fetchData();
     fetchDataFromApi();
     //refreshNotes();
    // TODO: implement onInit
    super.onInit();
  }

  void fetchData(){
     if(infolist.isNotEmpty)
       {
         final data = infolist.keys.map((key) {
           final infoItem = infolist.get(key);
           return {"key":key,"name":infoItem["name"],"phone":infoItem["phone"],"email":infoItem["email"],"address":infoItem["address"]};
         }).toList();

         infodataList = data.reversed.toList();
         print(infodataList[0]["name"].toString());
       }

  }
  Future<void> fetchDataFromApi()
  async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts#"));
    if(response.statusCode ==200)
      {
        var data = jsonDecode(response.body) as List;
        apiDataList.clear();
        for(Map i in data)
          {
              apiDataList.add(DemoInfoApi.fromJson(i));
          }
        print("fetch success");
      }
    else
      {
        print("failed bro");
      }
  }
  ///for save data to hive from api
///
///
  addAlldata() {
    for( DemoInfoApi i in apiDataList)
    {
      HiveDataModel ob = HiveDataModel();
      ob.UserID= i.userId!;
      ob.id= i.id!;
      ob.title= i.title!;
      ob.body= i.body!;
      final box = Boxes.getData();
      box.add(ob);
      ob.save();

      ob.save();
      // addSingleData({'title':i.title.toString(),'body':i.body.toString()});

    }
    // for(DemoInfoApi i in list){
    //
    //   addNewdata(i);
    // }
    // datafromApi.put("key", "Marufffffffff");
    // print(datafromApi.get("key").toString());

    // datafromApi.addAll(data);
    print("lenth is : "+Boxes.getData().length.toString());
  }

  // Future<void> addNewdata(DemoInfoApi i) async {
  //   await datafromApi.add(i);
  // }
  //
  // Future<void> addSingleData(Map<String,dynamic> newItem)async {
  //   await datafromApi.add(newItem);
  //
  //   //print("data amount :"+datafromApi.length.toString());
  // // _refreshNotes();
  //   // print("list length: "+ctrl.apiDataList.length.toString());
  // }
  // void refreshNotes(){
  //   final data = datafromApi.keys.map((key) {
  //     final Item = datafromApi.get(key);
  //     return {"key":key,"title":Item.first["title"],"body":Item["body"]};
  //   }).toList();
  //   // dataListfromApitoHive.clear();
  //   dataListfromApitoHive = data.toList();
  //   //print("let's see:"+dataListfromApitoHive.length.toString());
  //   // setState(() {
  //   //
  //   // });
  // }

  void getList()
  {

  }


}