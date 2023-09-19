import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_list_app/views/screens/calander_page.dart';
import 'package:todo_list_app/views/screens/home_page.dart';
import 'package:todo_list_app/views/screens/intro_screen.dart';
import 'package:todo_list_app/views/screens/list_page.dart';
import 'package:todo_list_app/views/screens/login_page.dart';
import 'package:todo_list_app/views/screens/my_task_informationpage.dart';
import 'package:todo_list_app/views/screens/project_information_page.dart';
import 'package:todo_list_app/views/screens/setting_page.dart';
import 'package:todo_list_app/views/screens/splash_screen.dart';

import 'firebase_options.dart';

void main() async{
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash_screen',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(name: '/splash_screen', page: () => const Splash_screen()),
        GetPage(name: '/intro_screen', page: () => const Intro_screen()),
        GetPage(name: '/login_page', page: () => const Login_page()),
        GetPage(name: '/home_page', page: () => const Home_page()),
        GetPage(name: '/list_page', page: () => const List_page()),
        GetPage(name: '/calender_page', page: () => const Calender_page()),
        GetPage(name: '/setting_page', page: ()=>const Setting_page()),
        GetPage(name: '/project_information_page', page: ()=>const Project_information_page()),
        GetPage(name: '/my_taskinformationpage', page: ()=>const My_taskinformation_page()),

      ],
    ),
  );
}
