import 'package:flutter/material.dart';
import 'package:flutter_assignment/login_screen_third.dart';
import 'package:flutter_assignment/view/bruteforce.dart';
import 'package:flutter_assignment/view/comman_password.dart';
import 'package:flutter_assignment/view/dashview.dart';
import 'package:flutter_assignment/view/rounded_cirlce_with_chek_mark.dart';
import 'package:flutter_assignment/view/rounded_textview.dart';
import 'package:flutter_assignment/view/textview_with_size_bold.dart';

class MyLoginSecondPage extends StatefulWidget {
  MyLoginSecondPage({Key key}) : super(key: key);

  //final String title;

  @override
  _MyLoginSecondPageState createState() => _MyLoginSecondPageState();
}

class _MyLoginSecondPageState extends State<MyLoginSecondPage> {
  bool isObsecure = true;
  bool isLowerCase = false,
      isUpperCase = false,
      isNumber = false,
      isCharacters = false;
  String tempPassword = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        titleSpacing: 0,
        title: Text("Create Account"),
        backgroundColor: Colors.transparent,
      ),
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Container(
                height: _keyboardIsVisible() ? 0 : height * 0.20,
                width: width,
                child: Row(
                  children: [
                    RoundedTextView(
                      mText: "1",
                      isDoneStage: true,
                    ),
                    DashLineView(),
                    RoundedTextView(
                      mText: "2",
                      isDoneStage: false,
                    ),
                    DashLineView(),
                    RoundedTextView(
                      mText: "3",
                      isDoneStage: false,
                    ),
                    DashLineView(),
                    RoundedTextView(
                      mText: "4",
                      isDoneStage: false,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                margin: EdgeInsets.fromLTRB(25, 0, 25, 5),
              ),
              Container(
                  height: height * 0.583,
                  width: width,
                  child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                            child: TextViewWithSizeBold(
                          "Create Password",
                          fontSize: 22.0,
                          color: Colors.white,
                          marginHorizontal: 25.0,
                        )),
                      ]),
                      Row(children: [
                        Expanded(
                            child: TextViewWithSizeBold(
                          "Password will be used to login account ",
                          fontSize: 16.0,
                          color: Colors.white,
                          marginVertical: 2.0,
                          marginHorizontal: 25.0,
                        ))
                      ]),
                      Container(
                        child: TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Create Password",
                              suffixIcon: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    isObsecure = !isObsecure;
                                  });
                                },
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent))),

                          onChanged: (String value) {
                            print(estimatePasswordStrength(value));
                            setState(() {
                              tempPassword = value;
                            });
                          },
                          keyboardType: TextInputType.text,
                          obscureText: isObsecure,
                          //onSaved: (String value) => tempEmail = value
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: new BorderRadius.all(
                                new Radius.circular(10.0))),
                        padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(25.0, 40.0, 25.0, 25.0),
                      ),
                      Row(children: [
                        Expanded(
                            child: Row(
                          children: [
                            TextViewWithSizeBold(
                              "Complexity :",
                              fontSize: 18.0,
                              color: Colors.white,
                              marginHorizontal: 25.0,
                            ),
                            TextViewWithSizeBold(
                              passwordComplexity(tempPassword),
                              fontSize: 16.0,
                              color: Colors.orangeAccent,
                              marginHorizontal: 5.0,
                            )
                          ],
                        )),
                      ]),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  validateLowaerCaseContains(tempPassword)
                                      ? RoundedImageVIewChecked(
                                          isDoneStage: true,
                                        )
                                      : TextViewWithSizeBold(
                                          "a",
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          marginHorizontal: 10.0,
                                        ),
                                  TextViewWithSizeBold(
                                    "lower case",
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    marginHorizontal: 10.0,
                                  )
                                ],
                              ),
                              flex: 1,
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  validateUpperCaseContains(tempPassword)
                                      ? RoundedImageVIewChecked(
                                          isDoneStage: true,
                                        )
                                      : TextViewWithSizeBold(
                                          "A",
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          marginHorizontal: 10.0,
                                        ),
                                  TextViewWithSizeBold(
                                    "upper case",
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    marginHorizontal: 10.0,
                                  )
                                ],
                              ),
                              flex: 1,
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  validateNumberContains(tempPassword)
                                      ? RoundedImageVIewChecked(
                                          isDoneStage: true,
                                        )
                                      : TextViewWithSizeBold(
                                          "123",
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          marginHorizontal: 10.0,
                                        ),
                                  TextViewWithSizeBold(
                                    "Number",
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    marginHorizontal: 10.0,
                                  )
                                ],
                              ),
                              flex: 1,
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  tempPassword.length > 8
                                      ? RoundedImageVIewChecked(
                                          isDoneStage: true,
                                        )
                                      : TextViewWithSizeBold(
                                          "9+",
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          marginHorizontal: 10.0,
                                        ),
                                  TextViewWithSizeBold(
                                    "Characters",
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    marginHorizontal: 10.0,
                                  )
                                ],
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(top: 30.0),
                      )
                    ],
                  ))
              // ,Spacer(flex: 1,)

              ,
              Container(
                  height: height * 0.10,
                  width: width * 0.95,
                  child: Row(
                    children: [
                      Expanded(
                          child: Builder(builder: (BuildContext innerContext) {
                        return RaisedButton(
                          onPressed: () {
                            if (!validatePasswordStructure(tempPassword)) {
                              final snackBar = SnackBar(
                                  content:
                                      Text('Please enter a valid password'));
                              Scaffold.of(innerContext).showSnackBar(snackBar);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyLoginThirdPage()),
                              );
                            }
                          },
                          color: Colors.blueGrey,
                          child: Container(
                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.white),
                            ),
                            padding: EdgeInsets.all(15.0),
                          ),
                        );
                      }))
                    ],
                  ))
            ],
          )),
      backgroundColor: Colors.blueAccent,
    );
  }

  bool validatePasswordStructure(String value) {
    if (validateLowaerCaseContains(value) &&
        validateUpperCaseContains(value) &&
        validateNumberContains(value) &&
        value.length > 8)
      return true;
    else
      return false;
  }

  bool validateLowaerCaseContains(String value) {
    for (int i = 0; i < value.length; i++) {
      if (double.parse(value[i], (e) => null) == null &&
          value[i].toLowerCase() == (value[i])) return true;
    }

    return false;
  }

  bool validateUpperCaseContains(String value) {
    for (int i = 0; i < value.length; i++) {
      if (double.parse(value[i], (e) => null) == null &&
          value[i].toUpperCase() == (value[i])) return true;
    }

    return false;
  }

  bool validateNumberContains(String value) {
    for (int i = 0; i < value.length; i++) {
      if (double.parse(value[i], (e) => null) != null) return true;
    }

    return false;
  }

  bool _keyboardIsVisible() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  String passwordComplexity(String password) {
    if (estimatePasswordStrength(password) < 0.5)
      return "Very Poor";
    else if (estimatePasswordStrength(password) > 0.5 &&
        estimatePasswordStrength(password) < 0.9)
      return "Medium";
    else if (estimatePasswordStrength(password) > 0.9) return "Excellent";
  }

  double estimatePasswordStrength(String password) {
    return estimateBruteforceStrength(password) *
        estimateCommonDictionaryStrength(password);
  }
}
