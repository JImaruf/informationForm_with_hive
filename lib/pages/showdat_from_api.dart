

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/boxes.dart';
import 'package:notesapp/controller/inputController.dart';
import 'package:notesapp/model/demoapiModel.dart';

class ShowDataFromApi extends StatelessWidget {
  final datafromApi = Boxes.getData();
  List<Map<String,dynamic>>  apidatalist = [];
   ShowDataFromApi({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Data From API'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: ctrl.apiDataList.length,
          itemBuilder: (context, index) {
            if(!ctrl.apiDataList.isEmpty)
              {
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
                          Text(textAlign: TextAlign.center,"Title: "+ctrl.apiDataList[index].title.toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 16),),
                          SizedBox(height: 10,),
                          Text(textAlign: TextAlign.center,"Details: "+ctrl.apiDataList[index].body.toString(),style: TextStyle(color: Colors.blueAccent),),
                        ],
                      ),
                    ),
                  ),
                );
              }

          },),

        bottomSheet: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/15,
          child: ElevatedButton(onPressed: (){

            ctrl.addAlldata();
            Get.snackbar("Success", "Data Added Successfully",colorText: Colors.white,backgroundColor: Colors.green);
          },
              child: Text("save to hive",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),),
        ),
      );
    });
  }


}
