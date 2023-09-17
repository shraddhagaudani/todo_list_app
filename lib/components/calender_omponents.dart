import 'package:flutter/material.dart';

class calender_component extends StatefulWidget {
  const calender_component({super.key});

  @override
  State<calender_component> createState() => _calender_componentState();
}

class _calender_componentState extends State<calender_component> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        Column(
          children: [
            Container(
              width: 393,
              height: 129,
              decoration: const BoxDecoration(
                color: Color(0xFF724FD6),
              ),
            )
          ],
        ),);
  }
}
