import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:hive/hive.dart';
import 'package:notesapp/controller/inputController.dart';

class EntryData extends StatelessWidget {
  TextEditingController nameTEController = TextEditingController();
  TextEditingController phoneTEController = TextEditingController();
  TextEditingController emailTEController = TextEditingController();
  TextEditingController addressTEController = TextEditingController();

  EntryData({super.key});

  final _infolist = Hive.box('infolist');

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return GetBuilder<InputController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Input Form"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: screenSize.width/8,
                      child: Text("Name:"),
                    ),

                    SizedBox(width: 20,),
                    Expanded(
                      child: TextField(
                        controller: nameTEController,
                        decoration: InputDecoration(
                            hintText: "Enter Your Name "
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        width: screenSize.width/8,
                        child: Text("Phone:")),
                    SizedBox(width: 20,),
                    Expanded(
                      child: TextField(
                        controller: phoneTEController,
                        decoration: InputDecoration(
                            hintText: "Enter Your Phone Number "
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        width: screenSize.width/8,
                        child: Text("Email:")),
                    SizedBox(width: 20,),
                    Expanded(
                      child: TextField(
                        controller: emailTEController,
                        decoration: InputDecoration(

                            hintText: "Enter Your Name "
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        width: screenSize.width/8,
                        child: Text("Address:")),
                    SizedBox(width: 20,),
                    Expanded(
                      child: TextField(
                        controller: addressTEController,
                        decoration: InputDecoration(
                            hintText: "Enter Your Address "
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: () {
                  _createNewInfo({
                    'name': nameTEController.text.toString(),
                    'phone': phoneTEController.text.toString(),
                    'email': emailTEController.text.toString(),
                    'address': addressTEController.text
                  });
                  ctrl.fetchData();
                }, child: Text("Save Data")),
              ]

          ),
        ),
      );
    });
  }

  Future<void> _createNewInfo(Map<String, dynamic> newInfo) async {
    await _infolist.add(newInfo);
    print("hello: " + _infolist.get(0).toString());
    print("hello: " + _infolist.length.toString());
    // final data = _infolist.keys.map((key) {
    //   final noteItem = _infolist.get(key);
    //   return {"key":key,"name":newInfo["name"],"phone":newInfo["phone"],"email":newInfo["email"]};
    // }).toList();
    //
    // _infodataList = data.reversed.toList();
    // print(_infodataList[0]["name"].toString());

  }
}
