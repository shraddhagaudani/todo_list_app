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
      getPages: [
        GetPage(name: '/splash_screen', page: () => const Splash_screen()),
        GetPage(name: '/intro_screen', page: () => const Intro_screen()),
        GetPage(name: '/login_page', page: () => const Login_page()),
        GetPage(name: '/home_page', page: () => const Home_page()),
        GetPage(name: '/list_page', page: () => const List_page()),
        GetPage(name: '/calender_page', page: () => const Calender_page()),
      ],
    ),
  );
}
