import 'package:flutter/material.dart';

class List_page extends StatefulWidget {
  const List_page({super.key});

  @override
  State<List_page> createState() => _Listt_pageState();
}

class _Listt_pageState extends State<List_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Container(
            width: 393,
            height: 129,
            decoration: const BoxDecoration(
              color: Color(0xFF724FD6),
            ),
          )
        ],
      ),
    );
  }
}
