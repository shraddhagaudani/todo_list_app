import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_list_app/controllers/introscreen_controller.dart';
import 'package:todo_list_app/controllers/login_out_controllers.dart';
import 'package:todo_list_app/helpers/firebase_auth_helper.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  IntroAccessController introAccessController = Get.put(IntroAccessController());
  LogINOutController logINOutController = Get.put(LogINOutController());
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then(
          (value) => (introAccessController.introAccess_Model.introaccess)
          ? (logINOutController.loginInOutModel.islogin)
          ? Get.offAndToNamed(
        '/home_page',
        arguments: FireBaseAuthHelper.firebaseAuth.currentUser,
      )
          : Get.offAndToNamed(
        '/login_page',
        // arguments: FirebaseAuthHelper.firebaseAuth.currentUser,
      )
          : Get.offAllNamed(
        '/intro_screen',
        // arguments: FirebaseAuthHelper.firebaseAuth.currentUser,
      ),
    );
    // Future.delayed(const Duration(seconds: 5)).then(
    //       (value) => Get.offAllNamed('/intro_screen'),
    // );
    return Scaffold(
      backgroundColor: Color(0xD1C0B6FD),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(16),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
             padding: const EdgeInsets.all(2),
              alignment: Alignment.center,
              height: 132,
              width: 132,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(11),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 21,
                          width: 21,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF724FD6),
                            // image: DecorationImage(fit: BoxFit.cover,
                            //   image: AssetImage("assets/images/checkw.png"),
                            // ),
                          ),
                          child: const Icon(
                            Icons.done_outline_rounded,
                            color: Colors.white,size: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Container(
                          height: Get.height * 0.012,
                          width: 71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFF724FD6),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 17,
                          width: 17,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF51C3F4),
                            // image: DecorationImage(fit: BoxFit.cover,
                            //   image: AssetImage("assets/images/checkw.png"),
                            // ),
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Container(
                          height: Get.height * 0.012,
                          width: 71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFF51C3F4),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 17,
                          width: 17,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFF6EAB),
                            // image: DecorationImage(fit: BoxFit.cover,
                            //   image: AssetImage("assets/images/checkw.png"),
                            // ),
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Container(
                          height: Get.height * 0.012,
                          width: 71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFFF6EAB),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "To",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: " -Do",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: " List",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // height: double.infinity,
        // child: Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     Container(
        //       width: 390,
        //       height: 844,
        //       padding: const EdgeInsets.only(
        //         top: 232,
        //         left: 94,
        //         right: 101,
        //         bottom: 418,
        //       ),
        //       clipBehavior: Clip.antiAlias,
        //       decoration: BoxDecoration(color: Color(0xD1C0B6FD)),
        //       child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Container(
        //             width: 132,
        //             height: 132,
        //             child: Stack(
        //               children: [
        //                 Positioned(
        //                   left: 0,
        //                   top: 0,
        //                   child: Container(
        //                     width: 132,
        //                     height: 132,
        //                     decoration: ShapeDecoration(
        //                       color: const Color(0xFFFDFAFA),
        //                       shape: RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(22),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //                 Positioned(
        //                   left: 44,
        //                   top: 23,
        //                   child: Container(
        //                     width: 71,
        //                     height: 12,
        //                     decoration: ShapeDecoration(
        //                       color: Color(0xFF724FD6),
        //                       shape: RoundedRectangleBorder(
        //                           borderRadius: BorderRadius.circular(5)),
        //                     ),
        //                   ),
        //                 ),
        //                 Positioned(
        //                   left: 44,
        //                   top: 63,
        //                   child: Container(
        //                     width: 71,
        //                     height: 12,
        //                     decoration: ShapeDecoration(
        //                       color: Color(0xFF51C3F4),
        //                       shape: RoundedRectangleBorder(
        //                           borderRadius: BorderRadius.circular(5)),
        //                     ),
        //                   ),
        //                 ),
        //                 Positioned(
        //                   left: 44,
        //                   top: 102,
        //                   child: Container(
        //                     width: 71,
        //                     height: 12,
        //                     decoration: ShapeDecoration(
        //                       color: const Color(0xFFFF6EAB),
        //                       shape: RoundedRectangleBorder(
        //                           borderRadius: BorderRadius.circular(5)),
        //                     ),
        //                   ),
        //                 ),
        //                 Positioned(
        //                   left: 13,
        //                   top: 16,
        //                   child: Container(
        //                     width: 27,
        //                     height: 27,
        //                     child: Stack(
        //                       children: [
        //                         Positioned(
        //                           left: 0,
        //                           top: 0,
        //                           child: Container(
        //                             width: 27,
        //                             height: 27,
        //                             decoration: ShapeDecoration(
        //                               color: Color(0xFF724FD6),
        //                               shape: OvalBorder(),
        //                             ),
        //                           ),
        //                         ),
        //                         Positioned(
        //                           left: 2.31,
        //                           top: 3.09,
        //                           child: Container(
        //                             width: 21,
        //                             height: 21,
        //                             child: Icon(
        //                               Icons.done_outline_rounded,
        //                               color: Colors.white,size: 18,
        //                             ),
        //                             // decoration: BoxDecoration(
        //                             //   image: DecorationImage(fit: BoxFit.cover,
        //                             //       image: AssetImage(
        //                             //           "assets/images/checkw.png",)
        //                             //       //   image: NetworkImage(
        //                             //       //       "https://via.placeholder.com/21x21"),
        //                             //       //   fit: BoxFit.fill,
        //                             //       // ),
        //                             //       ),
        //                             // ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //                 Positioned(
        //                   left: 17,
        //                   top: 60,
        //                   child: Container(
        //                     width: 19,
        //                     height: 19,
        //                     decoration: const ShapeDecoration(
        //                       color: Color(0xFF51C3F4),
        //                       shape: OvalBorder(),
        //                     ),
        //                   ),
        //                 ),
        //                 Positioned(
        //                   left: 17,
        //                   top: 99,
        //                   child: Container(
        //                     width: 19,
        //                     height: 19,
        //                     decoration: ShapeDecoration(
        //                       color: Color(0xB7FA408F),
        //                       shape: OvalBorder(),
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           const SizedBox(height: 18),
        //           Container(
        //             width: 195,
        //             height: 44,
        //             child: Stack(
        //               children: [
        //                 Positioned(
        //                   left: 0,
        //                   top: 0,
        //                   child: Text(
        //                     'To',
        //                     style: TextStyle(
        //                       color: Color(0xFFFDFAFA),
        //                       fontSize: 36,
        //                       fontFamily: 'Inter',
        //                       fontWeight: FontWeight.w600,
        //                     ),
        //                   ),
        //                 ),
        //                 Positioned(
        //                   left: 52,
        //                   top: 0,
        //                   child: Text(
        //                     '-D',
        //                     style: TextStyle(
        //                       color: Color(0xFFFDFAFA),
        //                       fontSize: 36,
        //                       fontFamily: 'Inter',
        //                       fontWeight: FontWeight.w600,
        //                     ),
        //                   ),
        //                 ),
        //                 Positioned(
        //                   left: 95,
        //                   top: 8,
        //                   child: Container(
        //                     width: 27,
        //                     height: 27,
        //                     child: Stack(
        //                       children: [
        //                         Positioned(
        //                           left: 0,
        //                           top: 0,
        //                           child: Container(
        //                             width: 27,
        //                             height: 27,
        //                             decoration: ShapeDecoration(
        //                               color: Color(0xFFFDFAFA),
        //                               shape: OvalBorder(),
        //                             ),
        //                           ),
        //                         ),
        //                         Positioned(
        //                           left: 2,
        //                           top: 2,
        //                           child: Container(
        //                             width: 23,
        //                             height: 23,
        //                             decoration: BoxDecoration(
        //                               image: DecorationImage(
        //                                 image: NetworkImage(
        //                                     "https://via.placeholder.com/23x23"),
        //                                 fit: BoxFit.fill,
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //                 Positioned(
        //                   left: 131,
        //                   top: 0,
        //                   child: Text(
        //                     'List',
        //                     style: TextStyle(
        //                       color: Color(0xFFFDFAFA),
        //                       fontSize: 36,
        //                       fontFamily: 'Inter',
        //                       fontWeight: FontWeight.w600,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
