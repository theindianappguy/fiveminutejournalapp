import 'package:fiveminutegeneral_web_app/helpers/constants.dart';
import 'package:fiveminutegeneral_web_app/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class Widgets {
  static Widget appBarMain(BuildContext context) {
    return AppBar(
      title: appBar(context),
      elevation: 0.0,
      centerTitle: false,
      brightness: Brightness.dark,
      actions: [
        GestureDetector(
          onTap: (){
            HelperFunctions.launchURL("https://sanskartiwari26.web.app/");
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("About Dev",style: TextStyle(color: Colors.white),)),
        )
      ],
    );
  }

  static Widget appBar(BuildContext context) {
    return Image.asset(
      "assets/images/logo.png",
      height: 33,
    );
  }

  static TextStyle simpleTextStyle() {
    return TextStyle(color: Constants.textColor);
  }

  static InputDecoration themedecoration({String hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
          color: Colors.grey, fontFamily: 'OverpassRegular', fontSize: 17),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Constants.textColor),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Constants.textColor),
      ),
    );
  }

  static TextStyle inputTextStyle() {
    return TextStyle(
      color: Constants.textColor,
      fontFamily: 'OverpassRegular',
    );
  }

  static Widget greenButton(
      {@required BuildContext context,
      @required String label,
      @required Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xff44BBA4),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/upload.png",
                  height: 15,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  label,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ],
            ),
          )),
    );
  }

  static Widget whiteBorderButton(
      {@required BuildContext context,
      @required String label,
      @required Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Constants.textColor),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: TextStyle(color: Constants.textColor, fontSize: 17),
                ),
              ],
            ),
          )),
    );
  }
}
