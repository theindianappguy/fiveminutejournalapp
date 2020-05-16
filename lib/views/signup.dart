import 'package:fiveminutegeneral_web_app/helpers/constants.dart';
import 'package:fiveminutegeneral_web_app/services/auth.dart';
import 'package:fiveminutegeneral_web_app/services/database.dart';
import 'package:fiveminutegeneral_web_app/views/home.dart';
import 'package:fiveminutegeneral_web_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String selectedAvatarUrl;

class SignUp extends StatefulWidget {
  final Function toogleView;

  SignUp({this.toogleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text feild
  bool _loading = false;
  String email = '', password = '', name = "";
  String error = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
/*    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Constants.colorPrimary));*/

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
                    alignment: Alignment.bottomCenter,
                    child: Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 30,left: 24, right: 24,),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width < 800
                                  ? 400
                                  : MediaQuery.of(context).size.width - 60,
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/book.png",height: 200,fit: BoxFit.cover,),
                                  Text(
                                    "A Happier You in 5 Minutes a Day",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Constants.textColor,
                                      fontSize: 17,
                                      fontFamily: 'OverpassRegular',
                                    ),
                                  ),
                                  SizedBox(height: 16,),
                                  Text(
                                    "Simple Daily Guided Format - Increase Gratitude & Happiness, Life Planner, Gratitude List",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Constants.textColor,
                                      fontSize: 13,
                                      fontFamily: 'OverpassRegular',
                                    ),
                                  ),
                                  SizedBox(height: 16,),
                                  ///
                                  Container(
                                    width: MediaQuery.of(context).size.width > 800
                                        ? 400
                                        : MediaQuery.of(context).size.width - 60,
                                    child: TextFormField(
                                      style: Constants.inputTextStyle(),
                                      validator: (val) =>
                                          val.isEmpty ? "Enter an Name" : null,
                                      decoration:
                                          Constants.themedecoration("username"),
                                      onChanged: (val) {
                                        setState(() {
                                          name = val.toLowerCase();
                                        });
                                      },
                                    ),
                                  ),

                                  SizedBox(
                                    height: 8,
                                  ),

                                  Container(
                                    width: MediaQuery.of(context).size.width > 800
                                        ? 400
                                        : MediaQuery.of(context).size.width - 60,
                                    child: TextFormField(
                                      style: Constants.inputTextStyle(),
                                      textCapitalization: TextCapitalization.none,
                                      validator: (val) =>
                                          val.isEmpty ? "Enter an Email" : null,
                                      decoration:
                                          Constants.themedecoration("email"),
                                      onChanged: (val) {
                                        setState(() {
                                          email = val;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width > 800
                                        ? 400
                                        : MediaQuery.of(context).size.width - 60,
                                    child: TextFormField(
                                      style: Constants.inputTextStyle(),
                                      validator: (val) => val.length > 6
                                          ? null
                                          : "Please Enter "
                                              "Password more than 6 character",
                                      decoration:
                                          Constants.themedecoration("password"),
                                      obscureText: true,
                                      onChanged: (val) {
                                        setState(() {
                                          password = val;
                                        });
                                      },
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

                                        await _authService
                                            .signUpWithEmailAndPassword(
                                                email, password)
                                            .then((value) {
                                          Constants.userId = value;
                                          if (value != null) {
                                            /// uploading user info to Firestore
                                            Map<String, String> userInfo = {
                                              "userName": name,
                                              "email": email,
                                            };
                                            DatabaseMethods()
                                                .addData(userInfo)
                                                .then((result) {});

                                            Constants
                                                .saveUserLoggedInSharedPreference(
                                                    true);
                                            Constants.saveUserNameSharedPreference(
                                                name);
                                            print("$name username saved");
                                            Constants.saveUserEmailSharedPreference(
                                                email);
                                            Constants.saveUserIdSharedPreference(
                                                Constants.userId);
                                            print("$email user email saved");

                                            setState(() {
                                              _loading = false;
                                            });

                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Home()));
                                          } else {
                                            setState(() {
                                              _loading = false;
                                              error =
                                                  "please supply a valid/another email";
                                            });
                                          }
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width > 800
                                          ? 400
                                          : MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 24),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(60),
                                          gradient: LinearGradient(
                                              colors: [
                                                const Color(0xff007EF4),
                                                const Color(0xff2A75BC)
                                              ],
                                              begin: FractionalOffset.topRight,
                                              end: FractionalOffset.bottomLeft)),
                                      child: Text(
                                        "Sign Up",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'OverpassRegular',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await _authService.signInWithGoogle(context);
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width > 800
                                          ? 400
                                          : MediaQuery.of(context).size.width - 60,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 30),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Constants.textColor,width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      child: Text(
                                        "Sign Up with Google",
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
                                    runSpacing: 4.0, // gap b
                                    children: <Widget>[
                                      Text(
                                        "Already have and account?",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Constants.textColor,
                                          fontSize: 16,
                                          fontFamily: 'OverpassRegular',
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            widget.toogleView();
                                          },
                                          child: Text(
                                            "Sign In",
                                            style: TextStyle(
                                              color: Constants.textColor,
                                              fontSize: 16,
                                              fontFamily: 'OverpassRegular',
                                              decoration: TextDecoration.underline,
                                            ),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
