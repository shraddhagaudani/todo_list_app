import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_list_app/controllers/theme_controller.dart';
import 'package:todo_list_app/helpers/db_helper.dart';
import 'package:todo_list_app/models/todo_model.dart';

class List_component extends StatefulWidget {
  const List_component({super.key});

  @override
  State<List_component> createState() => _List_componentState();
}

class _List_componentState extends State<List_component> {
  String? today;
  String? tomorrow;
  String? thisweek;
  String? highpriority;
  String? mediumpriority;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  DateTime initialDate = DateTime.now();

  DateTime? date;
  TimeOfDay initialTime = TimeOfDay.now();

  TimeOfDay? time;

  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 800,
              height: 152,
              decoration: const BoxDecoration(
                color: Color(0xFF724FD6),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.architecture,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      // SizedBox(
                      //   height: 40,
                      //   width: 250,
                      //   child: TextField(
                      //     decoration: InputDecoration(prefixIcon: Icon(Icons.search,color: Colors.black,),fillColor: Colors.white,
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(40),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        alignment: Alignment.topLeft,
                        width: 217,
                        height: 32,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(7),
                          child: Row(
                            children: [
                              // SizedBox(width: 10,),
                              Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 56,
                        height: 56,
                        decoration: const ShapeDecoration(
                          color: Color(0xD1C0B6FD),
                          shape: OvalBorder(),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.toNamed('/my_taskinformationpage');
                                },
                                icon: const Icon(
                                  Icons.other_houses,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: const Text(
                            "My Task",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Text("Pick Date:"),
                        IconButton(
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              cancelText: "Dismiss",
                              confirmText: "Confirm",
                              context: context,
                              initialDate: initialDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000),
                            );
                            setState(
                              () {
                                date = pickedDate;
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.calendar_month_outlined,
                          ),
                        ),
                        (date == null)
                            ? Container()
                            : Text("${date?.day}-${date?.month}-${date?.year}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Text("Pick Time:"),
                        IconButton(
                          onPressed: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: initialTime,
                            );
                            setState(
                              () {
                                time = pickedTime;
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.watch_later_outlined,
                          ),
                        ),
                        (time == null)
                            ? Container()
                            : Text("${time?.hour}:${time?.minute}"),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(
                          color: (themeController.themeModel.isdark)
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      RadioMenuButton(
                        value: "Scheduale for appoinment",
                        groupValue: today,
                        onChanged: (val) {
                          setState(() {
                            today = val;
                          });
                        },
                        child: const Text("Scheduale for appoinment"),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 70,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Color(0xFFD7C62D),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        RadioMenuButton(
                          value: "Prepare team meeting",
                          groupValue: today,
                          onChanged: (val) {
                            setState(() {
                              today = val;
                            });
                          },
                          child: const Text("Prepare team meeting"),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 28,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD4170B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "Add",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 28,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD4170B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "Work",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Tomorrow',
                        style: TextStyle(
                          color: (themeController.themeModel.isdark)
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      RadioMenuButton(
                        value: "Call charion",
                        groupValue: tomorrow,
                        onChanged: (val) {
                          setState(() {
                            tomorrow = val;
                          });
                        },
                        child: const Text("Call charion"),
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 70,
                        height: 28,
                        decoration: BoxDecoration(
                            color: const Color(0xFFD7C62D),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        RadioMenuButton(
                            value: "Submit experience 3.1",
                            groupValue: tomorrow,
                            onChanged: (val) {
                              setState(() {
                                tomorrow = val;
                              });
                            },
                            child: const Text("Submit experience 3.1")),
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 28,
                          decoration: BoxDecoration(
                            color: Color(0xFF724FD6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            "Add",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 28,
                          decoration: BoxDecoration(
                            color: const Color(0xFF724FD6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            "Work",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        RadioMenuButton(
                          value: "Prepare A/B test",
                          groupValue: tomorrow,
                          onChanged: (val) {
                            setState(() {
                              tomorrow = val;
                            });
                          },
                          child: const Text("Prepare A/B test"),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 28,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD4170B),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            "Add",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 28,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD4170B),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            "Work",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'This week',
                        style: TextStyle(
                          color: (themeController.themeModel.isdark)
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        RadioMenuButton(
                          value: "Submit experience 3.2",
                          groupValue: thisweek,
                          onChanged: (val) {
                            setState(() {
                              thisweek = val;
                            });
                          },
                          child: const Text("Submit experience 3.2"),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 28,
                          decoration: BoxDecoration(
                            color: Color(0xFF724FD6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            "Add",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 28,
                          decoration: BoxDecoration(
                            color: Color(0xFF724FD6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            "Work",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'High Priority',
                        style: TextStyle(
                          color: (themeController.themeModel.isdark)
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      RadioMenuButton(
                        value: "Finish Achievement",
                        groupValue: highpriority,
                        onChanged: (val) {
                          setState(() {
                            highpriority = val;
                          });
                        },
                        child: const Text("Finish Achievement"),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Color(0xFF724FD6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "Ok",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xFF724FD6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "Ready",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      RadioMenuButton(
                        value: "Prepare Team Meeting",
                        groupValue: highpriority,
                        onChanged: (val) {
                          setState(() {
                            highpriority = val;
                          });
                        },
                        child: const Text("Prepare Team Meeting"),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 70,
                        height: 28,
                        decoration: BoxDecoration(
                            color: Color(0xFFD4170B),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      RadioMenuButton(
                        value: "Schedual dentint Appoinment",
                        groupValue: highpriority,
                        onChanged: (val) {
                          setState(() {
                            highpriority = val;
                          });
                        },
                        child: const Text("Schedual dentint Appoinment"),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 70,
                        height: 28,
                        decoration: BoxDecoration(
                            color: Color(0xFFD7C62D),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Medium Priority',
                        style: TextStyle(
                          color: (themeController.themeModel.isdark)
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      RadioMenuButton(
                        value: "Book Tennis Court",
                        groupValue: mediumpriority,
                        onChanged: (val) {
                          setState(() {
                            mediumpriority = val;
                          });
                        },
                        child: const Text("Book Tennis Court"),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Color(0xFF724FD6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "Sport",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      RadioMenuButton(
                        value: "Prepare A/B test",
                        groupValue: mediumpriority,
                        onChanged: (val) {
                          setState(() {
                            mediumpriority = val;
                          });
                        },
                        child: const Text("Prepare A/B test"),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 70,
                        height: 28,
                        decoration: BoxDecoration(
                            color: const Color(0xFFD4170B),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 70,
                        height: 28,
                        decoration: BoxDecoration(
                            color: const Color(0xFFD4170B),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Text(
                          "Work",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      RadioMenuButton(
                        value: "Submit experience 3.1",
                        groupValue: mediumpriority,
                        onChanged: (val) {
                          setState(() {
                            mediumpriority = val;
                          });
                        },
                        child: const Text("Submit experience 3.1"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Color(0xFF724FD6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "Ok",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xFF724FD6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "Ready",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Medium Priority',
                        style: TextStyle(
                          color: (themeController.themeModel.isdark)
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      RadioMenuButton(
                        value: "Tryout My Mom’s receipe",
                        groupValue: mediumpriority,
                        onChanged: (val) {
                          setState(() {
                            mediumpriority = val;
                          });
                        },
                        child: const Text("Tryout My Mom’s receipe"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 70,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Color(0xFFD7C62D),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "Now",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.deepPurple.shade400),
                ),
                onPressed: () async {
                  ListMyTaskModel listMyTaskModel = ListMyTaskModel(
                      today: today!,
                      tomorrow: tomorrow!,
                      thisweek: thisweek!,
                      highpriority: highpriority!,
                      mediumpriority: mediumpriority!,
                      date: "${date?.day}-${date?.month}-${date?.year}",
                      time: "${time?.hour}:${time?.minute}");

                  int res = await DBHelper.dbHelper
                      .insertListMyTask(data: listMyTaskModel);

                  if (res >= 1) {
                    Get.snackbar(
                      "SUCCESS",
                      "My ListTask with id: $res inserted successfully...",
                      backgroundColor: Colors.green,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    Get.snackbar(
                      "FAILURE",
                      "My ListTask insertion failed...",
                      backgroundColor: Colors.red,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                  setState(() {
                    today = null;
                    tomorrow = null;
                    thisweek = null;
                    highpriority = null;
                    mediumpriority = null;
                  });

                },
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
