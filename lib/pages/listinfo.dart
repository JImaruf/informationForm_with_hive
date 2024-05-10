import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/controller/inputController.dart';

class ListInfo extends StatelessWidget {
  ListInfo({super.key});

  List<Map<String, dynamic>> infodataList = [];



  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text("List Info"),
        ),
        body: ListView.builder(
          itemCount: ctrl.infodataList.length,
            itemBuilder: (context, index) {
            if(ctrl.infodataList.isNotEmpty)
              {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                  Text(""+ctrl.infodataList[index]['name'].toString()),
                  Text(""+ctrl.infodataList[index]['phone'].toString()),
                  Text(""+ctrl.infodataList[index]['email'].toString()),
                  Text(""+ctrl.infodataList[index]['address'].toString()),
                    ],
                  ),
                );
              }
            },)
      );
    });
  }
}
