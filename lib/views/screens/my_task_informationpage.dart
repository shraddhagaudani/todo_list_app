import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:todo_list_app/helpers/db_helper.dart';

import '../../models/todo_model.dart';

class My_taskinformation_page extends StatefulWidget {
  const My_taskinformation_page({super.key});

  @override
  State<My_taskinformation_page> createState() =>
      _My_taskinformation_pageState();
}

class _My_taskinformation_pageState extends State<My_taskinformation_page> {
  late Future<List<ListMyTaskModel>> myAlltaskinformation;

  @override
  void initState() {
    myAlltaskinformation = DBHelper.dbHelper.fetchListMyTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Task Information"),
      ),
      body: FutureBuilder(
          future: myAlltaskinformation,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("ERROR:${snapshot.error}");
            } else if (snapshot.hasData) {
              List<ListMyTaskModel>? data = snapshot.data;
              if (data == null || data.isEmpty) {
                return const Text("No available data...");
              } else {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          color: Colors.deepPurple.shade100,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            height: 350,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Today:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(data[i].today),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "Tomorrow:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(data[i].tomorrow),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "This Week:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(data[i].thisweek),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "High priority:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(data[i].highpriority),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "Medium Priority:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(data[i].mediumpriority),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Get.dialog(
                                              AlertDialog(
                                                title: const Center(
                                                  child:
                                                      Text("Delete Spending"),
                                                ),
                                                content: const Text(
                                                    "Are you sure to delete this spending??"),
                                                actions: [
                                                  OutlinedButton(
                                                    onPressed: () async {
                                                      Get.back();

                                                      int res = await DBHelper
                                                          .dbHelper
                                                          .deleteListMyTask(
                                                              id: data[i]
                                                                  .mytaskid!);

                                                      if (res == 1) {
                                                        setState(() {
                                                          DBHelper.dbHelper
                                                              .fetchProject();
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
                                          icon: const Icon(Icons.delete))
                                    ],
                                  ),
                                ],
                              ),
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
