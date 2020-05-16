import 'package:fiveminutegeneral_web_app/helpers/constants.dart';
import 'package:fiveminutegeneral_web_app/services/auth.dart';
import 'package:fiveminutegeneral_web_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResetPass extends StatefulWidget {
  @override
  _ResetPassState createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  String email;
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 16, right: 16, top: 140, bottom: 140),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width > 400
                      ? 400
                      : MediaQuery.of(context).size.width - 48,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Please enter your registered email or mobile to reset your password",
                        style: TextStyle(
                            color: Constants.textColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: Constants.textColor),
                        validator: (val) =>
                            val.isEmpty ? "Enter an Email" : null,
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle:
                              TextStyle(color: Constants.textColor.withOpacity(0.5)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Constants.textColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Constants.textColor),
                          ),
                        ),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState.validate()) {
                        await _authService.resetPass(email);
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width > 400
                          ? 400
                          : MediaQuery.of(context).size.width - 48,
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
                        "Send Reset Password Link",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'OverpassRegular',
                            fontSize: 17),
                      ),
                    )),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Continue Login? ",
                      style: TextStyle(color: Constants.textColor, fontSize: 16),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Constants.textColor,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
