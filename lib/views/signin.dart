import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiveminutegeneral_web_app/helpers/constants.dart';
import 'package:fiveminutegeneral_web_app/services/auth.dart';
import 'package:fiveminutegeneral_web_app/services/database.dart';
import 'package:fiveminutegeneral_web_app/views/home.dart';
import 'package:fiveminutegeneral_web_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'forgot_password.dart';

class SignIn extends StatefulWidget {
  final Function toogleView;

  SignIn({this.toogleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  DatabaseMethods _databaseMethods = DatabaseMethods();
  final _formKey = GlobalKey<FormState>();

  bool _loading = false;

  // text field state
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String error = '';

  QuerySnapshot usersSnapshot;

  getRecentMembers() {
    _databaseMethods.getRecentUsers().then((snapshot) {
      print(snapshot.documents[0].data['userName'].toString() +
          "this is awesome");
      setState(() {
        usersSnapshot = snapshot;
      });
    });
  }

/*  Widget UsersList() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      height: 40,
      child: usersSnapshot != null
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: usersSnapshot.documents.length,
              itemBuilder: (context, index) {
                return userNameChip(
                    usersSnapshot.documents[index].data['userName']);
              })
          : Container(
              height: 20,
            ),
    );
  }*/

  Widget usersList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 12),
      height: 40,
      child: usersSnapshot != null
          ? CarouselSlider.builder(
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: false,
                  autoPlayAnimationDuration: Duration(milliseconds: 300)),
              itemCount: usersSnapshot.documents.length,
              itemBuilder: (context, index) {
                return userNameChip(
                    usersSnapshot.documents[index].data['userName']);
              })
          : Container(
              height: 20,
            ),
    );
  }

  Widget userNameChip(String label) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(new ClipboardData(text: label));
      },
      child: Container(
          margin: EdgeInsets.only(right: 8),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Text(
            "@$label",
            style: TextStyle(
                color: Color(0xff071930),
                fontWeight: FontWeight.w400,
                fontFamily: 'OverpassRegular',
                fontSize: 17),
          )),
    );
  }

  @override
  void initState() {
    getRecentMembers();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Constants.colorPrimary,
    ));*/

    return Scaffold(
        appBar: Widgets.appBarMain(context),
        body: _loading
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
              child: Column(
                children: [
                  Container(

                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(left: 24, right: 24, bottom: 30),
                    child: Container(
                      width: MediaQuery.of(context).size.width < 800
                          ? 400
                          : MediaQuery.of(context).size.width - 60,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/images/book.png",
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "A Happier You in 5 Minutes a Day",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.textColor,
                                fontSize: 17,
                                fontFamily: 'OverpassRegular',
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Simple Daily Guided Format - Increase Gratitude & Happiness, Life Planner, Gratitude List",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.textColor,
                                fontSize: 13,
                                fontFamily: 'OverpassRegular',
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Recent Members of FiveMinuteJournal",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.textColor,
                                fontSize: 15,
                                fontFamily: 'OverpassRegular',
                              ),
                            ),
                            usersList(),
                            SizedBox(height: 40,),
                            Form(
                              key: _formKey,
                              child: Container(
                                width: MediaQuery.of(context).size.width >
                                    600
                                    ? 400
                                    : MediaQuery.of(context).size.width -
                                    60,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    TextFormField(
                                      controller: emailController,
                                      style: Constants.inputTextStyle(),
                                      decoration:
                                      Constants.themedecoration("email"),
                                      validator: (val) =>
                                      val.isEmpty ? "Enter an Email" : null,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      controller: passwordController,
                                      style: Constants.inputTextStyle(),
                                      decoration:
                                      Constants.themedecoration("password"),
                                      validator: (val) => val.length > 6
                                          ? null
                                          : "Enter Password 6+ characters",
                                      obscureText: true,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width >
                                          600
                                          ? 400
                                          : MediaQuery.of(context).size.width -
                                          60,
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ResetPass()));
                                        },
                                        child: Text(
                                          "Forgot Password?",
                                          style: TextStyle(
                                            color: Constants.textColor,
                                            fontFamily: 'OverpassRegular',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() {
                                            _loading = true;
                                          });

                                          QuerySnapshot userInfoSnapshot =
                                          await _databaseMethods.getUserInfo(
                                              emailController.text);

                                          await _authService
                                              .signInWithEmailAndPassword(
                                              emailController.text,
                                              passwordController.text)
                                              .then((result) {
                                            Constants.userId = result;
                                            if (result == null) {
                                              setState(() {
                                                error =
                                                "please supply a valid email";
                                                _loading = false;
                                              });
                                            } else {
                                              Constants
                                                  .saveUserLoggedInSharedPreference(
                                                  true);
                                              Constants
                                                  .saveUserNameSharedPreference(
                                                  userInfoSnapshot
                                                      .documents[0]
                                                      .data["userName"]);
                                              Constants
                                                  .saveUserEmailSharedPreference(
                                                  emailController.text);
                                              Constants
                                                  .saveUserIdSharedPreference(
                                                  Constants.userId);
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Home()));
                                            }
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width >
                                            600
                                            ? 400
                                            : MediaQuery.of(context).size.width -
                                            60,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 24),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(60),
                                            gradient: LinearGradient(
                                                colors: [
                                                  const Color(0xff007EF4),
                                                  const Color(0xff2A75BC)
                                                ],
                                                begin: FractionalOffset.topRight,
                                                end:
                                                FractionalOffset.bottomLeft)),
                                        child: Text(
                                          "Sign In",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'OverpassRegular',
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await _authService
                                            .signInWithGoogle(context);
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width >
                                            600
                                            ? 400
                                            : MediaQuery.of(context).size.width -
                                            60,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 30),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Constants.textColor,
                                                width: 1),
                                            //color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        child: Text(
                                          "Sign In with Google",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff071930),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'OverpassRegular',
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: error.isEmpty
                                          ? Container()
                                          : Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            error,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 8.0, // gap between adjacent chips
                                      runSpacing: 4.0, // gap between lines
                                      children: <Widget>[
                                        Text(
                                          "Don't have account?",
                                          style: TextStyle(
                                            color: Constants.textColor,
                                            fontSize: 16,
                                            fontFamily: 'OverpassRegular',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              widget.toogleView();
                                            },
                                            child: Text(
                                              "Register now",
                                              style: TextStyle(
                                                color: Constants.textColor,
                                                fontSize: 16,
                                                fontFamily: 'OverpassRegular',
                                                decoration:
                                                TextDecoration.underline,
                                              ),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
