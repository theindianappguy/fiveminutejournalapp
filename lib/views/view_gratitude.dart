import 'package:fiveminutegeneral_web_app/helpers/constants.dart';
import 'package:fiveminutegeneral_web_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ViewGratitude extends StatefulWidget {
  final String time;
  final List<dynamic> gratitude;
  final List<dynamic> amazingThings;
  final List<dynamic> dailyaffirmation;
  final List<dynamic> maketodaygreat;
  final List<dynamic> todayBetter;
  ViewGratitude({this.gratitude, this.amazingThings, this.dailyaffirmation
    ,this.maketodaygreat, this.todayBetter,this.time,});

  @override
  _ViewGratitudeState createState() => _ViewGratitudeState();
}

class _ViewGratitudeState extends State<ViewGratitude> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Container(
            width: 700,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                  "${widget.time}",
                  style: TextStyle(
                      color: Constants.textColor.withOpacity(0.85),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "I am grateful for..",
                  style: TextStyle(
                      color: Constants.textColor.withOpacity(0.85),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "1. ${widget.gratitude[0]}",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "2. ${widget.gratitude[1]}",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "3. ${widget.gratitude[2]}",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),


                SizedBox(
                  height: 16,
                ),
                Text(
                  "What would make today great?",
                  style: TextStyle(
                      color: Constants.textColor.withOpacity(0.85),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "1. ${widget.maketodaygreat[0]}",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "2. ${widget.maketodaygreat[1]}",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "3. ${widget.maketodaygreat[2]}",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),


                SizedBox(
                  height: 16,
                ),
                Text(
                  "Daily affirmation. I am..?",
                  style: TextStyle(
                      color: Constants.textColor.withOpacity(0.85),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "1. ${widget.dailyaffirmation[0]}",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "2. ${widget.dailyaffirmation[1]}",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "3. ${widget.dailyaffirmation[2]}",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),


                SizedBox(
                  height: 16,
                ),
                Text(
                  "3 Amazing things that happened today...",
                  style: TextStyle(
                      color: Constants.textColor.withOpacity(0.85),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "1. ${widget.amazingThings[0]}",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "2. ${widget.amazingThings[1]}",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "3. ${widget.amazingThings[2]}",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),


                SizedBox(
                  height: 16,
                ),
                Text(
                  "How could i have made today better?",
                  style: TextStyle(
                      color: Constants.textColor.withOpacity(0.85),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "1. ${widget.todayBetter[0]}",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "2. ${widget.todayBetter[1]}",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "3. ${widget.todayBetter[2]}",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
