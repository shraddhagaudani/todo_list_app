import 'package:flutter/material.dart';
import 'package:todo_list_app/models/theme_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import '../utills/utills.dart';

class ThemeController extends GetxController{
  ThemeModel themeModel = ThemeModel(
    isdark: box.read('isDarkMode') ?? false,
  );

  ChangeTheme() {
    // themeModel.isdark = !themeModel.isdark;
    box.write('isDarkMode', themeModel.isdark = !themeModel.isdark);
    (themeModel.isdark)
        ? Get.changeTheme(
            ThemeData(useMaterial3: true, brightness: Brightness.dark))
        : Get.changeTheme(
            ThemeData(useMaterial3: true, brightness: Brightness.light));
    update();
  }
}
