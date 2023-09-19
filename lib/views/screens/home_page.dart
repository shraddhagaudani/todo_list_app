import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controllers/theme_controller.dart';
import 'package:todo_list_app/helpers/db_helper.dart';
import 'package:todo_list_app/helpers/firebase_auth_helper.dart';
import 'package:todo_list_app/models/todo_model.dart';

import '../../components/calender_omponents.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  TextEditingController projectnameController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? projectLables;
  String? projectStatus;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    User? user = Get.arguments as User?;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<ThemeController>(
        builder: (_) {
          return Form(
            key: formkey,
            child: Column(
              children: [
                Container(
                  height: 135,
                  width: 800,
                  color: const Color(0xFF724FD6),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Container(
                              height: 56,
                              width: 56,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xD1C0B6FD),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Get.toNamed('/setting_page', arguments: user);
                                },
                                icon: const Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                color: Color(0xFFFFF5F5),
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'List',
                            style: TextStyle(
                              color: (themeController.themeModel.isdark)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Calendar',
                            style: TextStyle(
                              color: (themeController.themeModel.isdark)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Karbon',
                            style: TextStyle(
                              color: (themeController.themeModel.isdark)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          IconButton(
                            onPressed: () {
                              Get.toNamed('/list_page');
                            },
                            icon: const Icon(
                              Icons.list,
                            ),
                          ),
                          const SizedBox(
                            width: 55,
                          ),
                          IconButton(
                            onPressed: () {
                              // Get.toNamed('calender_component()');
                            },
                            icon: const Icon(
                              Icons.list_alt_rounded,
                              size: 24,
                            ),
                          ),
                          const SizedBox(
                            width: 70,
                          ),

                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.call_to_action,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Projects',
                            style: TextStyle(
                              color: (themeController.themeModel.isdark)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.chevron_down,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.add,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: projectnameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please enter ProjectName";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Enter Project name",
                          label: Text("Project Name"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Lables',
                            style: TextStyle(
                              color: (themeController.themeModel.isdark)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.chevron_down),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.add),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Project Lables : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          DropdownButton(
                            hint: const Text("Choose project Lables"),
                            onChanged: (val) {
                              projectLables = val;
                            },
                            items: const [
                              DropdownMenuItem(
                                value: "Study",
                                child: Text("Study"),
                              ),
                              DropdownMenuItem(
                                value: "Work",
                                child: Text("Work"),
                              ),
                              DropdownMenuItem(
                                value: "Habit",
                                child: Text("Habit"),
                              ),
                              DropdownMenuItem(
                                value: "Sport",
                                child: Text("Sport"),
                              ),
                              DropdownMenuItem(
                                value: "Personal",
                                child: Text("Personal"),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Row(
                        children: [
                          Text(
                            'Status',
                            style: TextStyle(
                              color: (themeController.themeModel.isdark)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.chevron_down,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.add,
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const Text(
                              "Spending type :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            RadioMenuButton(
                              value: "To do",
                              groupValue: projectStatus,
                              onChanged: (val) {
                                setState(() {
                                  projectStatus = val;
                                });
                              },
                              child: const Text("To do"),
                            ),
                            RadioMenuButton(
                              value: "Doing",
                              groupValue: projectStatus,
                              onChanged: (val) {
                                setState(() {
                                  projectStatus = val;
                                });
                              },
                              child: const Text("Doing"),
                            ),
                            RadioMenuButton(
                              value: "Done",
                              groupValue: projectStatus,
                              onChanged: (val) {
                                setState(() {
                                  projectStatus = val;
                                });
                              },
                              child: const Text("Done"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();

            ToDoModel toDoModel = ToDoModel(
                projectname: projectnameController.text,
                projectlables: projectLables!,
                projectstatus: projectStatus!);

            int res = await DBHelper.dbHelper.insertProject(data: toDoModel);

            if (res >= 1) {
              Get.snackbar(
                "SUCCESS",
                "Project with id: $res inserted successfully...",
                backgroundColor: Colors.green,
                snackPosition: SnackPosition.BOTTOM,
              );
            } else {
              Get.snackbar(
                "FAILURE",
                "Project insertion failed...",
                backgroundColor: Colors.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }
          }
          projectnameController.clear();
          setState(() {
            projectLables = null;
            projectStatus = null;
          });
          Get.toNamed('/project_information_page');
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
