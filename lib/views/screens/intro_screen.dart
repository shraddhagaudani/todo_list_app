import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Intro_screen extends StatefulWidget {
  const Intro_screen({super.key});

  @override
  State<Intro_screen> createState() => _Intro_screenState();
}

class _Intro_screenState extends State<Intro_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 40,
                ),
                Container(
                  height: 132,
                  width: 132,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: const Color(0xFF724FD6),
                  ),
                  child: const Icon(
                    Icons.done_outline_rounded,
                    color: Colors.white,
                    size: 42,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                Text(
                  "Get things done.",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 26,
                      color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                Text(
                  "just a click away from\nplanning your task.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xFFD9D9D9),
                      letterSpacing: 1),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                CircleAvatar(
                  radius: 7,
                  backgroundColor:Color(0xFFD9D9D9),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 7,
                  backgroundColor: Color(0xFFD9D9D9),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 7,
                  backgroundColor: Color(0xFF724FD6),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Positioned(
                //   left: 56,
                //   top: 170.71,
                //   child: Container(
                //     width: 132,
                //     height: 132,
                //     decoration: BoxDecoration(shape: BoxShape.circle),
                //     child: Stack(
                //       children: [
                //         Positioned(
                //           left: 0,
                //           top: 0,
                //           child: Container(
                //             width: 132,
                //             height: 132,
                //             decoration: ShapeDecoration(
                //               color: Color(0xFF724FD6),
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(90),
                //               ),
                //             ),
                //           ),
                //         ),
                //         Positioned(
                //           left: 42.32,
                //           top: 41.31,
                //           child: Container(
                //             width: 48.37,
                //             height: 48.37,
                //             // decoration: BoxDecoration(
                //             //   image: DecorationImage(
                //             //     image: NetworkImage("https://via.placeholder.com/48x48"),
                //             //     fit: BoxFit.fill,
                //             //   ),
                //             // ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(alignment: Alignment.center,
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF724FD6),
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        IconButton(
                          onPressed: () {
                            Get.offAllNamed('/login_page');
                          },
                          icon: const Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
