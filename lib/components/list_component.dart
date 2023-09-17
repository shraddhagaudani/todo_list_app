import 'package:flutter/material.dart';

class List_component extends StatefulWidget {
  const List_component({super.key});

  @override
  State<List_component> createState() => _List_componentState();
}

class _List_componentState extends State<List_component> {
  String? today;
  String? tomorrow;
  String? thisweek;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: Column(
        children: [
          Container(
            width: 800,
            height: 135,
            decoration: const BoxDecoration(
              color: Color(0xFF724FD6),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.architecture)),
                    // TextField(decoration: InputDecoration()),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 25,),
                const Row(
                  children: [

                    Text(
                      'Today',
                      style: TextStyle(
                        color: Colors.black,
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
                const Row(
                  children: [
                    Text(
                      'Tomorrow',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    SizedBox(
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
                const Row(
                  children: [
                    Text(
                      'This week',
                      style: TextStyle(
                        color: Colors.black,
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
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
