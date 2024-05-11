import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/boxes.dart';
import 'package:notesapp/controller/inputController.dart';
import 'package:notesapp/pages/entrydata.dart';
import 'package:notesapp/pages/listinfo.dart';
import 'package:notesapp/pages/showdat_from_api.dart';
import 'package:notesapp/pages/showdata_fetchandstoretohive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(EntryData());
                  },
                  child: Text("Data Entry")),
              ElevatedButton(
                  onPressed: () {
                    Get.to(ListInfo());
                  },
                  child: Text("show Data List")),
              ElevatedButton(
                  onPressed: () {
                    ctrl.infodataList.clear();
                    Hive.box('infolist').clear();
                    Get.snackbar("Deleted", "Deleted Successfully",
                        colorText: Colors.white,
                        backgroundColor: Colors.redAccent);
                  },
                  child: Text("Delete from Hive ")),
              ElevatedButton(
                  onPressed: () {
                    Get.to(ShowDataFromApi());
                  },
                  child: Text("Show Data from API ")),
              ElevatedButton(
                  onPressed: () {
                    Get.to(FetchedDatasavedHive());
                  },
                  child: Text("API Data In Local Storage")),
              ElevatedButton(
                  onPressed: () {
                    Boxes.getData().clear();
                    Get.snackbar("Deleted", "Deleted Successfully",
                        colorText: Colors.white,
                        backgroundColor: Colors.redAccent);
                  },
                  child: Text("Delete API Data Of Local Storage")),
            ],
          ),
        ),
      );
    });
  }
}
