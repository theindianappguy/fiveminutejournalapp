import 'package:fiveminutegeneral_web_app/helpers/constants.dart';
import 'package:fiveminutegeneral_web_app/services/database.dart';
import 'package:fiveminutegeneral_web_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateGratitude extends StatefulWidget {
  final bool isNew;
  final String time;
  final List<dynamic> gratitude;
  final List<dynamic> amazingThings;
  final List<dynamic> dailyaffirmation;
  final List<dynamic> maketodaygreat;
  final List<dynamic> todayBetter;

  UpdateGratitude( this.isNew, {this.gratitude, this.amazingThings, this.dailyaffirmation
    ,this.maketodaygreat, this.todayBetter,this.time,});

  @override
  _UpdateGratitudeState createState() => _UpdateGratitudeState();
}

class _UpdateGratitudeState extends State<UpdateGratitude> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();

  DatabaseMethods databaseMethods = new DatabaseMethods();

  TextEditingController gratitude1EditingController = new TextEditingController();
  TextEditingController gratitude2EditingController = new TextEditingController();
  TextEditingController gratitude3EditingController = new TextEditingController();
  TextEditingController maketodaygreat1EditingController = new TextEditingController();
  TextEditingController maketodaygreat2EditingController = new TextEditingController();
  TextEditingController maketodaygreat3EditingController = new TextEditingController();
  TextEditingController dailyaffirmation1EditingController = new TextEditingController();
  TextEditingController dailyaffirmation2EditingController = new TextEditingController();
  TextEditingController dailyaffirmation3EditingController = new TextEditingController();
  TextEditingController amazingThings1EditingController = new TextEditingController();
  TextEditingController amazingThings2EditingController = new TextEditingController();
  TextEditingController amazingThings3EditingController = new TextEditingController();
  TextEditingController todayBetter1EditingController = new TextEditingController();
  TextEditingController todayBetter2EditingController = new TextEditingController();
  TextEditingController todayBetter3EditingController = new TextEditingController();

  TextEditingController getController(String info){
    switch (info) {
      case "gratitude1":
        return gratitude1EditingController;
        break;
      case "gratitude2":
        return gratitude2EditingController;
        break;
      case "gratitude3":
        return gratitude3EditingController;
        break;
      case "maketodaygreat1":
        return maketodaygreat1EditingController;
        break;
      case "maketodaygreat2":
        return maketodaygreat2EditingController;
        break;
      case "maketodaygreat3":
        return maketodaygreat3EditingController;
        break;
      case "dailyaffirmation1":
        return dailyaffirmation1EditingController;
        break;
      case "dailyaffirmation2":
        return dailyaffirmation2EditingController;
        break;
      case "dailyaffirmation3":
        return dailyaffirmation3EditingController;
        break;
      case "amazingThings1":
        return amazingThings1EditingController;
        break;
      case "amazingThings2":
        return amazingThings2EditingController;
        break;
      case "amazingThings3":
        return amazingThings3EditingController;
        break;
      case "todayBetter1":
        return todayBetter1EditingController;
        break;
      case "todayBetter2":
        return todayBetter2EditingController;
        break;
      case "todayBetter3":
        return todayBetter3EditingController;
        break;
    }
  }

  Widget customTextFormField(String numberSt, String typeSt) {
    return Container(
      child: Row(
        children: [
          Text(
            "$numberSt.",
            style: Widgets.simpleTextStyle(),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              children: [
                TextFormField(
                  validator: (val) {
                    return val == "" ? "is required" : null;
                  },
                  style: Widgets.simpleTextStyle(),
                  controller: getController("${typeSt + numberSt}"),
                  decoration: Widgets.themedecoration(hintText: ""),
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    if(!widget.isNew){
      setInfo();
    }else{
      amazingThings1EditingController.text= " ";
      amazingThings2EditingController.text= " ";
      amazingThings3EditingController.text= " ";

      todayBetter1EditingController.text= " ";
      todayBetter2EditingController.text= " ";
      todayBetter3EditingController.text= " ";
    }
    getUserInfo();
    super.initState();
  }


  setInfo(){
    gratitude1EditingController.text= widget.gratitude[0];
    gratitude2EditingController.text= widget.gratitude[1];
    gratitude3EditingController.text= widget.gratitude[2];

    maketodaygreat1EditingController.text= widget.maketodaygreat[0];
    maketodaygreat2EditingController.text= widget.maketodaygreat[1];
    maketodaygreat3EditingController.text= widget.maketodaygreat[2];

    dailyaffirmation1EditingController.text= widget.dailyaffirmation[0];
    dailyaffirmation2EditingController.text= widget.dailyaffirmation[1];
    dailyaffirmation3EditingController.text= widget.dailyaffirmation[2];

    amazingThings1EditingController.text= widget.amazingThings[0];
    amazingThings2EditingController.text= widget.amazingThings[1];
    amazingThings3EditingController.text= widget.amazingThings[2];

    todayBetter1EditingController.text= widget.todayBetter[0];
    todayBetter2EditingController.text= widget.todayBetter[1];
    todayBetter3EditingController.text= widget.todayBetter[2];
  }


  getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Constants.userId =
         prefs.getString(Constants.sharedPreferenceUserIDKey);
    print("this is awesoemmememmeem" + Constants.userId);
  }

  String getMonth(int i) {
    switch (i) {
      case 1:
        return "Jan";
        break;
      case 2:
        return "Feb";
        break;
      case 3:
        return "Mar";
        break;
      case 4:
        return "Apr";
        break;
      case 5:
        return "May";
        break;
      case 6:
        return "Jun";
        break;
      case 7:
        return "July";
        break;
      case 8:
        return "Aug";
        break;
      case 9:
        return "Sep";
        break;
      case 10:
        return "Oct";
        break;
      case 11:
        return "Nov";
        break;
      case 12:
        return "Dec";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.appBarMain(context),
      body: _isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  width: 700,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.asset("assets/images/sun.png",height: 40,),
                                  SizedBox(width: 12,),
                                  Text(
                                    "Morning routine",
                                    style: TextStyle(
                                        color: Constants.textColor.withOpacity(0.7),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "I am grateful for..",
                                style: TextStyle(
                                    color: Constants.textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              customTextFormField("1", "gratitude"),
                              customTextFormField("2", "gratitude"),
                              customTextFormField("3", "gratitude"),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "What would make today great?",
                                style: TextStyle(
                                    color: Constants.textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              customTextFormField("1", "maketodaygreat"),
                              customTextFormField("2", "maketodaygreat"),
                              customTextFormField("3", "maketodaygreat"),
                              SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Daily affirmation. I am..?",
                                style: TextStyle(
                                    color: Constants.textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              customTextFormField("1", "dailyaffirmation"),
                              customTextFormField("2", "dailyaffirmation"),
                              customTextFormField("3", "dailyaffirmation"),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                Image.asset("assets/images/moon.png",height: 40,),
                                SizedBox(width: 12,),
                                Text(
                                  "Night routine",
                                  style: TextStyle(
                                      color: Constants.textColor.withOpacity(0.7),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "3 Amazing things that happened today...",
                                style: TextStyle(
                                    color: Constants.textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              customTextFormField("1", "amazingThings"),
                              customTextFormField("2", "amazingThings"),
                              customTextFormField("3", "amazingThings"),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "How could i have made today better?",
                                style: TextStyle(
                                    color: Constants.textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              customTextFormField("1", "todayBetter"),
                              customTextFormField("2", "todayBetter"),
                              customTextFormField("3", "todayBetter"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Widgets.greenButton(
                                context: context,
                                label: widget.isNew ? "Submit " : "Update",
                                onTap: () {
                                  ///TODO
                                  if (formKey.currentState.validate()) {
                                    formKey.currentState.save();
                                    List<String> amazingThings = [
                                      amazingThings1EditingController.text,
                                      amazingThings2EditingController.text,
                                      amazingThings3EditingController.text
                                    ];
                                    List<String> dailyaffirmation = [
                                      dailyaffirmation1EditingController.text,
                                      dailyaffirmation2EditingController.text,
                                      dailyaffirmation3EditingController.text
                                    ];
                                    List<String> gratitude = [
                                      gratitude1EditingController.text,
                                      gratitude2EditingController.text,
                                      gratitude3EditingController.text
                                    ];
                                    List<String> maketodaygreat = [
                                      maketodaygreat1EditingController.text,
                                      maketodaygreat2EditingController.text,
                                      maketodaygreat3EditingController.text
                                    ];
                                    List<String> todayBetter = [
                                      todayBetter1EditingController.text,
                                      todayBetter2EditingController.text,
                                      todayBetter3EditingController.text
                                    ];

                                    var now = DateTime.now();
                                    //var text = '${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}';
                                    //print(text.toString());
                                    String timeAndDate =
                                        "${now.day.toString() + getMonth(now.month) + now.year.toString()}";
                                    String time =
                                        "${now.day.toString().toString()} ${getMonth(now.month).toString()} ${now.year.toString()}";
                                    print("time : ${widget.isNew ? time : widget.time}");

                                    Map<String, dynamic> gratitudeMap = {
                                      "amazingThings": amazingThings,
                                      "dailyaffirmation": dailyaffirmation,
                                      "gratitude": gratitude,
                                      "maketodaygreat": maketodaygreat,
                                      "todayBetter": todayBetter,
                                      "time": widget.isNew ? timeAndDate : widget.time
                                    };

                                    databaseMethods.uploadGratitude(
                                        gratitudeMap, widget.isNew ? time : widget.time.toString());

                                    Navigator.pop(context);
                                  }
                                }),
                            SizedBox(
                              width: 24,
                            ),
                            Widgets.whiteBorderButton(
                                context: context,
                                label: "Cancel",
                                onTap: () {
                                  Navigator.pop(context);
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
