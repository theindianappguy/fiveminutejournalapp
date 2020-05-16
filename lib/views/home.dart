import 'package:fiveminutegeneral_web_app/helpers/constants.dart';
import 'package:fiveminutegeneral_web_app/services/database.dart';
import 'package:fiveminutegeneral_web_app/views/view_gratitude.dart';
import 'package:fiveminutegeneral_web_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_gratutude.dart';

/// this is a calendar view with button to add Gratitude
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Stream gratitudeStream;
  DatabaseMethods databaseMethods = new DatabaseMethods();

  Widget gratitudeList() {
    return Container(
      child: gratitudeStream != null
          ? Column(
        children: <Widget>[
          StreamBuilder(
            stream: gratitudeStream,
            builder: (context, snapshot) {
              return snapshot.hasData ? GridView(
                padding: EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 0.0, maxCrossAxisExtent: 240.0),
                children: List.generate(snapshot.data.documents.length, (index) {
                  return GratitudeTile(
                    time: snapshot
                        .data.documents[index].data['time'],
                    gratitude: snapshot
                        .data.documents[index].data['gratitude'],
                    amazingThings: snapshot
                        .data.documents[index].data['amazingThings'],
                    dailyaffirmation: snapshot
                        .data.documents[index].data['dailyaffirmation'],
                    maketodaygreat: snapshot
                        .data.documents[index].data['maketodaygreat'],
                    todayBetter: snapshot
                        .data.documents[index].data['todayBetter'],
                  );
                }),
              ) : Container(
                height: MediaQuery.of(context).size.width,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ); /*: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: snapshot.data.documents.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return
                  });*/
            },
          )
        ],
      )
          : Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    getUserInfoAndGratitudeList();
    super.initState();
  }

  getUserInfoAndGratitudeList() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Constants.userId = prefs.getString(Constants.sharedPreferenceUserIDKey);
    databaseMethods.getGratitudeData().then((result) {
      setState(() {
        gratitudeStream = result;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          child: gratitudeList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UpdateGratitude(true,)));
        },
      ),
    );
  }
}


class GratitudeTile extends StatelessWidget {
  final List<dynamic> gratitude;
  final List<dynamic> amazingThings;
  final List<dynamic> dailyaffirmation;
  final List<dynamic> maketodaygreat;
  final List<dynamic> todayBetter;
  final String time;

  GratitudeTile(
      {@required this.gratitude,
      @required this.time
        ,this.amazingThings, this.dailyaffirmation
        ,this.maketodaygreat, this.todayBetter});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ViewGratitude(
              time: time.toString(),
              gratitude: gratitude,
              amazingThings: amazingThings,
              dailyaffirmation: dailyaffirmation,
              maketodaygreat: maketodaygreat,
              todayBetter:todayBetter,)
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffEC4E20).withOpacity(0.3),
          borderRadius: BorderRadius.circular(23)
        ),
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        margin: EdgeInsets.only(bottom: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$time",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13,
                      color: Constants.textColor,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                PopupMenuButton(
                  icon: Icon(Icons.more_vert, color: Constants.textColor,size: 16,),
                  onSelected: (newValue) {
                    //TODO
                    switch(newValue){
                      case 0:
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => UpdateGratitude(
                              false,
                              time: time.toString().replaceAll(" ", ""),
                              gratitude: gratitude,
                              amazingThings: amazingThings,
                              dailyaffirmation: dailyaffirmation,
                              maketodaygreat: maketodaygreat,
                              todayBetter:todayBetter,)
                        ));
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("Edit"),
                      value: 0,
                    ),
                  ],
                ),

              ],
            ),
            SizedBox(height: 4,),
            Text(
              "I am grateful for..",
              style: TextStyle(
                  fontSize: 17,
                  color: Constants.textColor,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "1. ${gratitude[0]}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15,
                        color: Constants.textColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "2. ${gratitude[1]}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15,
                        color: Constants.textColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "3. ${gratitude[2]}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15,
                        color: Constants.textColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
