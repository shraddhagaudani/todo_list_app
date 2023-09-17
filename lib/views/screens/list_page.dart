import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/components/calender_omponents.dart';
import 'package:todo_list_app/components/list_component.dart';
import 'package:todo_list_app/controllers/navigation_controller.dart';
import 'package:todo_list_app/views/screens/calander_page.dart';

class List_page extends StatefulWidget {
  const List_page({super.key});

  @override
  State<List_page> createState() => _Listt_pageState();
}

class _Listt_pageState extends State<List_page> {
  NavigationController navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      builder: (_) {
        return Scaffold(
          // body: Column(
          //   children: [
          //     Container(
          //       width: 393,
          //       height: 129,
          //       decoration: const BoxDecoration(
          //         color: Color(0xFF724FD6),
          //       ),
          //     )
          //   ],
          // ),
          body: PageView(
            controller: navigationController.pageController,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (val) {
              setState(
                () {
                  navigationController.initialval = val;
                },
              );
            },
            children: const [
              List_component(),
              calender_component(),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: navigationController.initialval,
            onDestinationSelected: (val) {
              setState(
                () {
                  navigationController.initialval = val;
                  navigationController.pageController.animateToPage(
                    navigationController.initialval,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                  );
                },
              );
            },
            destinations: const [
              NavigationDestination(icon: Icon(Icons.list), label: ""),
              NavigationDestination(icon: Icon(Icons.date_range), label: ""),
            ],
          ),
        );
      },
    );
  }
}
