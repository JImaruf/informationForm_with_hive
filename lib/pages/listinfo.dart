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
              if (!ctrl.infodataList.isEmpty) {
                return Card(
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(children: [
                        Text(
                          "Name: " +
                              ctrl.infodataList[index]['name'].toString(),
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          "Phone: " +
                              ctrl.infodataList[index]['phone'].toString(),
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          "Email:" +
                              ctrl.infodataList[index]['email'].toString(),
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          "Address:" +
                              ctrl.infodataList[index]['address'].toString(),
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        // Wrap(
                        //   children:[
                        //     Text(""+ctrl.infodataList[index]['name'].toString(),style: TextStyle(color:Colors.white),),
                        //     Text(""+ctrl.infodataList[index]['phone'].toString()),
                        //     Text(""+ctrl.infodataList[index]['email'].toString()),
                        //     Text(""+ctrl.infodataList[index]['address'].toString()),
                        //   ]
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children:[
                        //     Text("Name: "+ctrl.infodataList[index]['name'].toString(),style: TextStyle(fontSize:16,color:Colors.white),),
                        //     Text("Phone: "+ctrl.infodataList[index]['phone'].toString(),style: TextStyle(fontSize:16,color:Colors.white),),
                        //   ]
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Text("Email:"+ctrl.infodataList[index]['email'].toString(),style: TextStyle(fontSize:16,color:Colors.white),),
                              // Text("Address:"+ctrl.infodataList[index]['address'].toString(),style: TextStyle(fontSize:16,color:Colors.white),),
                            ]),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //
                        // Text(""+ctrl.infodataList[index]['name'].toString()),
                        // Text(""+ctrl.infodataList[index]['phone'].toString()),
                        // Text(""+ctrl.infodataList[index]['email'].toString()),
                        // Text(""+ctrl.infodataList[index]['address'].toString()),
                        //   ],
                        // ),
                      ]),
                    ));
              } else {
                return Text("No Data Available");
              }
            },
          ));
    });
  }
}
