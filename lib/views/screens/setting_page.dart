import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_list_app/controllers/theme_controller.dart';
import 'package:todo_list_app/helpers/firebase_auth_helper.dart';

class Setting_page extends StatefulWidget {
  const Setting_page({super.key});

  @override
  State<Setting_page> createState() => _Setting_pageState();
}

class _Setting_pageState extends State<Setting_page> {
  ThemeController themeController = Get.put(ThemeController());
  User? user = Get.arguments as User?;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GetBuilder<ThemeController>(
          builder: (_) {
            return Column(
              children: [
                Container(
                  height: 210,
                  width: double.infinity,
                  color: Colors.deepPurple,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.profile_circled,
                          size: 120,
                          color: (themeController.themeModel.isdark)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Center(
                        child: Text(
                          "${user!.email}",
                          style: TextStyle(
                              color: (themeController.themeModel.isdark)
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ListTile(
                        tileColor: Colors.black12,
                        style: ListTileStyle.list,
                        title: Text(
                          "Logout",
                          style: TextStyle(
                              color: (themeController.themeModel.isdark)
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        subtitle: const Text(
                          "Logout your account",
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            await FireBaseAuthHelper.fireBaseAuthHelper
                                .signOut();
                            Get.offNamed('/login_page');
                          },
                          icon: const Icon(CupertinoIcons.power),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        tileColor: Colors.black12,
                        style: ListTileStyle.list,
                        title: Text(
                          "Theme",
                          style: TextStyle(
                              color: (themeController.themeModel.isdark)
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        subtitle: const Text("App Theme"),
                        trailing: IconButton(
                          onPressed: () async {
                            themeController.ChangeTheme();
                          },
                          icon: (themeController.themeModel.isdark)
                              ? const Icon(CupertinoIcons.sun_min)
                              : const Icon(
                                  CupertinoIcons.moon,
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        tileColor: Colors.black12,
                        style: ListTileStyle.list,
                        title: Text(
                          "Privacy Policy",
                          style: TextStyle(
                              color: (themeController.themeModel.isdark)
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        subtitle: const Text("App Privacy Policy"),
                        trailing: IconButton(
                          onPressed: () async {},
                          icon: const Icon(
                            Icons.privacy_tip_rounded,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        tileColor: Colors.black12,
                        style: ListTileStyle.list,
                        title: Text(
                          "Terms & Condition",
                          style: TextStyle(
                              color: (themeController.themeModel.isdark)
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        subtitle: const Text("App Terms & Condition"),
                        trailing: IconButton(
                          onPressed: () async {},
                          icon: const Icon(
                            CupertinoIcons.timelapse,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
