import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_list_app/helpers/db_helper.dart';

import '../../models/todo_model.dart';

class Project_information_page extends StatefulWidget {
  const Project_information_page({super.key});

  @override
  State<Project_information_page> createState() =>
      _Project_information_pageState();
}

class _Project_information_pageState extends State<Project_information_page> {
  late Future<List<ToDoModel>> getAllProjectInformation;

  @override
  void initState() {
    getAllProjectInformation = DBHelper.dbHelper.fetchProject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Project Information "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
            future: getAllProjectInformation,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("ERROR:${snapshot.error}");
              } else if (snapshot.hasData) {
                List<ToDoModel>? data = snapshot.data;

                if (data == null || data.isEmpty) {
                  return Center(child: const Text("No data available..."));
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, i) {
                        return Card(
                          color: Colors.deepPurple.shade100,
                          child: Container(
                            padding: EdgeInsets.all(16),
                            height: 215,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Project Name:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(data[i].projectname),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Project Lables:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(data[i].projectlables),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Project Status:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(data[i].projectstatus),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Get.dialog(
                                            AlertDialog(
                                              title: const Center(
                                                child: Text("Delete Project"),
                                              ),
                                              content: const Text(
                                                  "Are you sure to delete this Project??"),
                                              actions: [
                                                OutlinedButton(
                                                  onPressed: () async {
                                                    Get.back();

                                                    int res = await DBHelper
                                                        .dbHelper
                                                        .deleteProject(
                                                            id: data[i]
                                                                .projectid!);

                                                    if (res == 1) {
                                                      setState(() {
                                                      getAllProjectInformation =   DBHelper.dbHelper
                                                            .fetchProject();
                                                      });
                                                      Get.snackbar("SUCCESS",
                                                          "Project deleted successfully...",
                                                          snackPosition:
                                                              SnackPosition
                                                                  .BOTTOM);
                                                    } else {
                                                      Get.snackbar("FAILURE",
                                                          "Project deletion failed...",
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
                        );
                      });
                }
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
