import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_list_app/helpers/db_helper.dart';

import '../../models/todo_model.dart';

class Calender_information_page extends StatefulWidget {
  const Calender_information_page({super.key});

  @override
  State<Calender_information_page> createState() =>
      _Calender_information_pageState();
}

class _Calender_information_pageState extends State<Calender_information_page> {
  late Future<List<CalenderModel>> allCalenderInformation;

  @override
  void initState() {
    allCalenderInformation = DBHelper.dbHelper.fetchCalender();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calender information"),
      ),
      body: FutureBuilder(
          future: allCalenderInformation,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("ERROR:${snapshot.error}");
            } else if (snapshot.hasData) {
              List<CalenderModel>? data = snapshot.data;

              if (data!.isEmpty || data == null) {
                return const Center(
                  child: Text("No available data..."),
                );
              } else {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.deepPurple.shade100,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            height: 235,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Today Date:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(data[i].date),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Today Time:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(data[i].time),
                                const SizedBox(
                                  height: 10,
                                ),

                              const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Your Choice:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(data[i].workinformation),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Get.dialog(
                                          AlertDialog(
                                            title: const Center(
                                              child: Text("Delete Scheduled"),
                                            ),
                                            content: const Text(
                                                "Are you sure to delete this scheduled??"),
                                            actions: [
                                              OutlinedButton(
                                                onPressed: () async {
                                                  Get.back();

                                                  int res = await DBHelper
                                                      .dbHelper
                                                      .deleteCalender(
                                                          id: data[i]
                                                              .calenderid!);

                                                  if (res == 1) {
                                                    setState(() {
                                                      allCalenderInformation =
                                                          DBHelper.dbHelper
                                                              .fetchCalender();
                                                    });
                                                    Get.snackbar("SUCCESS",
                                                        "Spending deleted successfully...",
                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM);
                                                  } else {
                                                    Get.snackbar("FAILURE",
                                                        "Spending deletion failed...",
                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM);
                                                  }
                                                },
                                                child: const Text("Yes"),
                                              ),
                                              OutlinedButton(
                                                onPressed: () async {
                                                  Get.back();
                                                },
                                                child: const Text("No"),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
