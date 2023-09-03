import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/helpers/firebase_auth_helper.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 129,
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
                      IconButton(
                        onPressed: ()async {
                         await FireBaseAuthHelper.fireBaseAuthHelper.signOut();
                         Get.offNamed('/login_page');
                        },
                        icon: const Icon(CupertinoIcons.power),
                      ),
                      const Spacer(),
                      Container(
                        height: 56,
                        width: 56,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xD1C0B6FD),
                        ),
                        child: IconButton(
                          onPressed: () {},
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'List',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Calandar',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Karbon',
                      style: TextStyle(
                        color: Colors.black,
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
                        Get.toNamed('/calender_page');
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
                    const Text(
                      'Projects',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.down_arrow)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(CupertinoIcons.add))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Lables',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.down_arrow)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(CupertinoIcons.add))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Status',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.down_arrow)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(CupertinoIcons.add))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
