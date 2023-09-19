import 'package:flutter/material.dart';

class calender_component extends StatefulWidget {
  const calender_component({super.key});

  @override
  State<calender_component> createState() => _calender_componentState();
}

class _calender_componentState extends State<calender_component> {
  DateTime initialDate = DateTime.now();

  DateTime? date;
  TimeOfDay initialTime = TimeOfDay.now();

  TimeOfDay? time;

  String? calanderpage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 393,
            height: 129,
            decoration: const BoxDecoration(
              color: Color(0xFF724FD6),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Text("Pick Date:"),
                IconButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      cancelText: "Dismiss",
                      confirmText: "Confirm",
                      context: context,
                      initialDate: initialDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000),
                    );

                    setState(
                      () {
                        date = pickedDate;
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.calendar_month_outlined,
                  ),
                ),
                (date == null)
                    ? Container()
                    : Text("${date?.day}-${date?.month}-${date?.year}"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Text("Pick Time:"),
                IconButton(
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: initialTime,
                    );

                    setState(
                      () {
                        time = pickedTime;
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.watch_later_outlined,
                  ),
                ),
                (time == null)
                    ? Container()
                    : Text("${time?.hour}:${time?.minute}"),
              ],
            ),
          ),
          Row(
            children: [
              RadioMenuButton(
                value: "Scheduale Mentor Call",
                groupValue: calanderpage,
                onChanged: (val) {
                  setState(() {
                    calanderpage = val;
                  });
                },
                child: const Text("Scheduale Mentor Call"),
              ),
              Container(
                alignment: Alignment.center,
                width: 60,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF724FD6),
                ),
                child: const Text(
                  "Ok",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.center,
                width: 60,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF724FD6),
                ),
                child: const Text(
                  "Ready",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          Row(
            children: [
              RadioMenuButton(
                value: "Book Tennis Court",
                groupValue: calanderpage,
                onChanged: (val) {
                  setState(() {
                    calanderpage = val;
                  });
                },
                child: const Text("Book Tennis Court"),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                alignment: Alignment.center,
                width: 60,
                height: 28,
                decoration: BoxDecoration(
                  color: const Color(0xFF724FD6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "Sport",
                  style: TextStyle(color: Colors.white),
                ),
              ),

            ],
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Done"),
          ),
        ],
      ),
    );
  }
}
