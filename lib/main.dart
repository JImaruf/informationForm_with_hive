import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/controller/inputController.dart';
import 'package:notesapp/pages/entrydata.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/pages/home_page.dart';

import 'pages/listinfo.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("infolist");
  Get.put(InputController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.grey, width: 2.5)) ),

        inputDecorationTheme: const InputDecorationTheme(

          hintStyle: TextStyle(color: Colors.green),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3,color: Colors.grey)
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3,color: Colors.red)
          ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3,color: Colors.cyan)
          ),
          enabledBorder:OutlineInputBorder(
              borderSide: BorderSide(width: 3,color: Colors.grey)
          ) ,
          border: OutlineInputBorder(
          )
        ),

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(
      ),
    );
  }
}


