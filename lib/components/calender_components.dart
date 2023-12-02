import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_list_app/helpers/db_helper.dart';
import 'package:todo_list_app/models/todo_model.dart';

class calender_component extends StatefulWidget {
  const calender_component({super.key});

  @override
  State<calender_component> createState() => _calender_componentState();
}

class _calender_componentState extends State<calender_component> {
  DateTime initialDate = DateTime.now();

  DateTime? date;
  TimeOfDay initialTime = TimeOfDay.now();

  TimeOfDay? time;

  String? calanderpage;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController workinformationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Container(
              width: 393,
              height: 152,
              decoration: const BoxDecoration(
                color: Color(0xFF724FD6),
              ),
              child: Row(
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.toNamed('/calender_informationpage');
                                },
                                icon: const Icon(
                                  Icons.other_houses,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
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
            Padding(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                controller: workinformationController,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter your choice information";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter Your Choice",
                  label: Text("Your Choice"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // Row(
            //   children: [
            //     RadioMenuButton(
            //       value: "Scheduale Mentor Call",
            //       groupValue: calanderpage,
            //       onChanged: (val) {
            //         setState(() {
            //           calanderpage = val;
            //         });
            //       },
            //       child: const Text("Scheduale Mentor Call"),
            //     ),
            //     Container(
            //       alignment: Alignment.center,
            //       width: 60,
            //       height: 28,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(15),
            //         color: const Color(0xFF724FD6),
            //       ),
            //       child: const Text(
            //         "Ok",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 10,
            //     ),
            //     Container(
            //       alignment: Alignment.center,
            //       width: 60,
            //       height: 28,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(15),
            //         color: const Color(0xFF724FD6),
            //       ),
            //       child: const Text(
            //         "Ready",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     )
            //   ],
            // ),
            // Row(
            //   children: [
            //     RadioMenuButton(
            //       value: "Book Tennis Court",
            //       groupValue: calanderpage,
            //       onChanged: (val) {
            //         setState(() {
            //           calanderpage = val;
            //         });
            //       },
            //       child: const Text("Book Tennis Court"),
            //     ),
            //     const SizedBox(
            //       width: 30,
            //     ),
            //     Container(
            //       alignment: Alignment.center,
            //       width: 60,
            //       height: 28,
            //       decoration: BoxDecoration(
            //         color: const Color(0xFF724FD6),
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //       child: const Text(
            //         "Sport",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();

                  CalenderModel calendermodel = CalenderModel(
                    date: "${date?.day}-${date?.month}-${date?.year}",
                    time: "${time?.hour}:${time?.minute}",
                    // scheduled: calanderpage!,
                    workinformation: workinformationController.text,
                  );

                  int res = await DBHelper.dbHelper
                      .insertCalender(data: calendermodel);

                  if (res >= 1) {
                    Get.snackbar(
                      "SUCCESS",
                      "Project with id: $res inserted successfully...",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    Get.snackbar(
                      "FAILURE",
                      "Project insertion failed...",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                  workinformationController.clear();
                  setState(() {
                    time = null;
                    date = null;
                    calanderpage = null;
                  });
                }
              },
              child: const Text(
                "Done",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
