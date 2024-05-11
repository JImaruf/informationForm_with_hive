import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/boxes.dart';
import 'package:notesapp/controller/inputController.dart';
import 'package:notesapp/model/hivedatamodel.dart';

class FetchedDatasavedHive extends StatelessWidget {
  const FetchedDatasavedHive({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Data from Local Storage"),
        ),
        body: ValueListenableBuilder<Box<HiveDataModel>>(
          valueListenable: Boxes.getData().listenable(),
          builder: (context,box,_) {
            var data = box.values.toList().cast<HiveDataModel>();
           return ListView.builder(itemCount:  box.length,
             itemBuilder: (context, index) {
               return Padding(
                 padding: const EdgeInsets.all(4.0),
                 child: Card(
                   elevation: 5,
                   color: Colors.yellow,
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Text("No:"+data[index].id.toString()),
                         Text(textAlign: TextAlign.center,"Title: "+data[index].title.toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 16),),
                         SizedBox(height: 10,),
                         Text(textAlign: TextAlign.center,"Details: "+data[index].body.toString(),style: TextStyle(color: Colors.blueAccent),),
                       ],
                     ),
                   ),
                 ),
               );
           },);
          },)
      );
    });
  }
}
