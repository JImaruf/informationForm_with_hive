import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/pages/entrydata.dart';
import 'package:notesapp/pages/listinfo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Get.to(EntryData());
          },
              child: Text("Data Entry")
          ),
          ElevatedButton(onPressed: (){
            Get.to(ListInfo());
          },
              child: Text("show Data List")
          ),
        ],
      ),
    );
  }
}
