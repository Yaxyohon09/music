// import 'dart:nativewrappers/_internal/vm/lib/mirrors_patch.dart';
// import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Sahifa1(),
  ));
}

class Sahifa1 extends StatefulWidget {
  const Sahifa1({super.key});

  @override
  State<Sahifa1> createState() => _Sahifa1State();
}

class _Sahifa1State extends State<Sahifa1> {
  TimeOfDay date = TimeOfDay(
    hour: 12,
    minute: 12,
  );
  DateTime day = DateTime(
    2024,
  );
  void days() async {
    DateTime? newday = await showDatePicker(
      context: context,
      firstDate: DateTime(
        1700,
      ),
      lastDate: DateTime(
        8000,
      ),
    );
    if (newday != null) {
      setState(
        () {
          day = newday;
        },
      );
    }
  }

  void dates() async {
    TimeOfDay? newdate = await showTimePicker(
      context: context,
      initialTime: date,
    );
    if (newdate != null) {
      setState(
        () {
          date = newdate;
        },
      );
    }
  }

  void reflesh() {
    setState(
      () {
        date = TimeOfDay(
          hour: 12,
          minute: 12,
        );
        day = DateTime(
          2024,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${date.hour} : ${date.minute}",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            "${day.day} - ${day.month} - ${day.year}",
            style: TextStyle(
              fontSize: 35,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  dates();
                },
                icon: Icon(
                  Icons.timelapse_sharp,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () {
                  reflesh();
                },
                icon: Icon(
                  Icons.restart_alt,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () {
                  days();
                },
                icon: Icon(
                  Icons.calendar_month,
                  size: 40,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
