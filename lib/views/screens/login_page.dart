import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_list_app/controllers/indexedstack_controller.dart';
import 'package:todo_list_app/helpers/firebase_auth_helper.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
  GlobalKey<FormState> signupformkey = GlobalKey<FormState>();

  TextEditingController loginpasswordController = TextEditingController();
  TextEditingController loginemailController = TextEditingController();

  TextEditingController signuppasswordController = TextEditingController();
  TextEditingController signupemailController = TextEditingController();

  String? email;
  String? password;

  IndexedStackValController indexedStackValController =
      Get.put(IndexedStackValController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexedStackValController>(
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: IndexedStack(
                index: indexedStackValController.indexedModel.indexedval,
                children: [
                  Column(
                    children: [
                      Form(
                        key: loginformkey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 132,
                              width: 132,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: const Color(0xFF724FD6),
                              ),
                              child: const Icon(
                                Icons.done_outline_rounded,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Welcome back!",
                              style: TextStyle(
                                fontSize: 26,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "E-mail",
                                  style: TextStyle(
                                      color: Color(0xFF857E7E), fontSize: 18),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            // TextFormField(
                            //   controller: loginemailController,
                            //   validator: (val) {
                            //     if (val!.isEmpty) {
                            //       return "Please enter email first..";
                            //     }
                            //     return null;
                            //   },
                            //   decoration: InputDecoration(
                            //     filled: true,
                            //     fillColor: const Color(
                            //       0xFFD9D9D9,
                            //     ),
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(20),
                            //       borderSide: const BorderSide(
                            //         color: Color(0xFFD9D9D9),
                            //         // style: BorderStyle.none,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            TextFormField(
                              controller: loginemailController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please enter email first..";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(
                                  0xFFD9D9D9,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFD9D9D9),
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      color: Color(0xFF857E7E), fontSize: 18),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            // TextFormField(
                            //   controller: loginpasswordController,
                            //   validator: (val) {
                            //     if (val!.isEmpty) {
                            //       return "Please password email first..";
                            //     }
                            //     return null;
                            //   },
                            //   decoration: InputDecoration(
                            //     // filled: true,
                            //     // fillColor: const Color(
                            //     //   0xFFD9D9D9,
                            //     // ),
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(20),
                            //       borderSide: const BorderSide(
                            //         color: Color(0xFFD9D9D9),
                            //         style: BorderStyle.none,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            TextFormField(obscureText: true,
                              controller: loginpasswordController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please enter password first..";
                                }
                                return null;
                              },
                              decoration: InputDecoration(

                                filled: true,
                                fillColor: const Color(
                                  0xFFD9D9D9,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFD9D9D9),
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {

                                ValidateAndSignIn();
                                loginemailController.clear();
                                loginpasswordController.clear();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 48,
                                width: 171,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xFF724FD6),
                                ),
                                child: const Text(
                                  "Log in",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFF4F1F1),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Or log in with',
                              style: TextStyle(
                                color: Color(0xFF857E7E),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 82,
                                  width: 82,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xD31D0E49),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.facebook,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 82,
                                  width: 82,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xE8D3160A),
                                  ),
                                  child: IconButton(
                                    onPressed: () async {
                                      Map<String, dynamic> data =
                                          await FireBaseAuthHelper
                                              .fireBaseAuthHelper
                                              .signInWithGoogle();

                                      if (data['user'] != null) {
                                        Get.snackbar("SUCCESSFULLY",
                                            "Login Successfully with Google..",
                                            backgroundColor: Colors.green);
                                        Get.offNamed('/home_page',
                                            arguments: data['user']);
                                        // logINOutController.logInOutTrueValue();
                                      } else {
                                        Get.snackbar("FAILURE", data['msg'],
                                            backgroundColor: Colors.red);
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.g_mobiledata,
                                      size: 70,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 82,
                                  width: 82,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF100F0F),
                                  ),
                                  child: IconButton(
                                    onPressed: () async {},
                                    icon: const Icon(
                                      Icons.apple_outlined,
                                      size: 60,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text.rich(
                              TextSpan(
                                text: "Don't have an account? ",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF857E7E),
                                ),
                                children: [
                                  TextSpan(
                                    text: "Get started",
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xFF724FD6),
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        setState(() {
                                          indexedStackValController
                                              .indexedModel.indexedval = 1;
                                        });
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //signup layer:
                  Column(
                    children: [
                      Form(
                        key: signupformkey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 132,
                              width: 132,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: const Color(0xFF724FD6),
                              ),
                              child: const Icon(
                                Icons.done_outline_rounded,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Let's get started!",
                              style: TextStyle(
                                fontSize: 26,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "E-mail",
                                  style: TextStyle(
                                      color: Color(0xFF857E7E), fontSize: 18),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: signupemailController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please enter email first..";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(
                                  0xFFD9D9D9,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFD9D9D9),
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      color: Color(0xFF857E7E), fontSize: 18),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(obscureText: true,
                              controller: signuppasswordController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please enter password first..";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(
                                  0xFFD9D9D9,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFD9D9D9),
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                print(signupemailController.text);
                                print(signuppasswordController.text);
                                ValidateAndSignUp();
                                signupemailController.clear();
                                signuppasswordController.clear();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 48,
                                width: 171,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xFF724FD6),
                                ),
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFF4F1F1),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Or sign up with',
                              style: TextStyle(
                                color: Color(0xFF857E7E),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 82,
                                  width: 82,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xD31D0E49),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.facebook,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 82,
                                  width: 82,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xE8D3160A),
                                  ),
                                  child: IconButton(
                                    onPressed: () async {},
                                    icon: const Icon(
                                      Icons.g_mobiledata,
                                      size: 70,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 82,
                                  width: 82,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF100F0F),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.apple_outlined,
                                      size: 60,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text.rich(
                              TextSpan(
                                text: "Already have an account? ",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF857E7E),
                                ),
                                children: [
                                  TextSpan(
                                    text: "Log in",
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xFF724FD6),
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        setState(() {
                                          indexedStackValController
                                              .indexedModel.indexedval = 0;
                                        });
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> ValidateAndSignUp() async {
    if (signupformkey.currentState!.validate()) {
      signupformkey.currentState!.save();

      Map<String, dynamic> data = await FireBaseAuthHelper.fireBaseAuthHelper
          .signUpWithEmailAndPassword(
              Email: signupemailController.text,
              Password: signuppasswordController.text);

      if (data['user'] != null) {
        Get.snackbar(
          "SUCCESSFULLY",
          "successfully signup....😊",
          duration: const Duration(seconds: 1),
        );
      } else {
        Get.snackbar(
          "NOT SUCCESSFULLY",
          data['msg'],
          duration: const Duration(seconds: 1),
        );
      }
    }
  }

  Future<void> ValidateAndSignIn() async {
    if (loginformkey.currentState!.validate()) {
      loginformkey.currentState!.save();

      Map<String, dynamic> data = await FireBaseAuthHelper.fireBaseAuthHelper
          .signInWithEmailAndPassword(
              Email: loginemailController.text,
              Password: loginpasswordController.text);
      if (data['user'] != null) {
        Get.snackbar(
          "SUCCESSFULLY",
          "successfully login....😊",
          duration: const Duration(seconds: 1),
        );
        Get.offNamed('/home_page', arguments: data['user']);
      } else {
        Get.snackbar(
          "NOT SUCCESSFULLY",
          data['msg'],
          duration: const Duration(seconds: 1),
        );
      }
    }
  }
}
