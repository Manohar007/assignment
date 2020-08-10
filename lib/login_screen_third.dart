import 'package:flutter/material.dart';
import 'package:flutter_assignment/login_screen_four.dart';
import 'package:flutter_assignment/view/dashview.dart';
import 'package:flutter_assignment/view/dropdown_custom.dart';
import 'package:flutter_assignment/view/rounded_textview.dart';
import 'package:flutter_assignment/view/textview_with_size_bold.dart';

class MyLoginThirdPage extends StatefulWidget {
  MyLoginThirdPage({Key key}) : super(key: key);

  @override
  _MyLoginThirdPageState createState() => _MyLoginThirdPageState();
}

class _MyLoginThirdPageState extends State<MyLoginThirdPage> {
  String goalTempStr = "-Choose Option-",
      monthlyTempStr = "-Choose Option-",
      monthlyExpStr = "-Choose Option-";

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
                height: height * 0.20,
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
                      isDoneStage: true,
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
                          "Personal Information",
                          fontSize: 22.0,
                          color: Colors.white,
                          marginHorizontal: 25.0,
                        )),
                      ]),
                      Row(children: [
                        Expanded(
                            child: TextViewWithSizeBold(
                          "Please fill in the information below  and your goal for digital saving ",
                          fontSize: 16.0,
                          color: Colors.white,
                          marginVertical: 2.0,
                          marginHorizontal: 25.0,
                        ))
                      ]),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Goal for Activation",
                                style: TextStyle(color: Colors.grey),
                              ),
                              padding: EdgeInsets.only(left: 5.0, top: 5.0),
                            ),
                            DropdownButtonHideUnderline(
                                child: CustomDropdownButton<String>(
                              items: <String>[
                                '-Choose Option-',
                                'For Money Saving',
                                'For Future',
                                'None'
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(
                                    value,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String value) {
                                setState(() {
                                  goalTempStr = value;
                                });
                              },
                              hint: Text(
                                goalTempStr,
                                style: TextStyle(color: Colors.black),
                              ),
                            ))
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: new BorderRadius.all(
                                new Radius.circular(10.0))),
                        padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(25.0, 40.0, 25.0, 5.0),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Montly Income",
                                style: TextStyle(color: Colors.grey),
                              ),
                              padding: EdgeInsets.only(left: 5.0, top: 5.0),
                            ),
                            DropdownButtonHideUnderline(
                                child: CustomDropdownButton<String>(
                              items: <String>[
                                '-Choose Option-',
                                '10,000',
                                '20,000',
                                '30,000',
                                '40,000',
                                '50,000'
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(
                                    value,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String value) {
                                setState(() {
                                  monthlyTempStr = value;
                                });
                              },
                              hint: Text(
                                monthlyTempStr,
                                style: TextStyle(color: Colors.black),
                              ),
                            ))
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: new BorderRadius.all(
                                new Radius.circular(10.0))),
                        padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 5.0),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Monthly Expenditure",
                                style: TextStyle(color: Colors.grey),
                              ),
                              padding: EdgeInsets.only(left: 5.0, top: 5.0),
                            ),
                            DropdownButtonHideUnderline(
                                child: CustomDropdownButton<String>(
                              items: <String>[
                                '-Choose Option-',
                                '10,000',
                                '20,000',
                                '30,000',
                                '40,000',
                                '50,000'
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(
                                    value,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String value) {
                                setState(() {
                                  monthlyExpStr = value;
                                });
                              },
                              hint: Text(
                                monthlyExpStr,
                                style: TextStyle(color: Colors.black),
                              ),
                            ))
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: new BorderRadius.all(
                                new Radius.circular(10.0))),
                        padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 5.0),
                      ),
                    ],
                  )),
              Container(
                  height: height * 0.10,
                  width: width * 0.95,
                  child: Row(
                    children: [
                      Expanded(
                          child: Builder(builder: (BuildContext innerContext) {
                        return RaisedButton(
                          onPressed: () {
                            if (!validateInputeDataFields()) {
                              final snackBar = SnackBar(
                                  content: Text('Please select all data '));
                              Scaffold.of(innerContext).showSnackBar(snackBar);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyLoginFourPage()),
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

  bool validateInputeDataFields() {
    if (goalTempStr != "-Choose Option-" &&
        monthlyTempStr != "-Choose Option-" &&
        monthlyExpStr != "-Choose Option-")
      return true;
    else
      return false;
  }
}
