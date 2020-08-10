import 'package:flutter/material.dart';
import 'package:flutter_assignment/login_screen_second.dart';
import 'package:flutter_assignment/view/dashview.dart';
import 'package:flutter_assignment/view/rounded_textview.dart';
import 'package:flutter_assignment/view/textview_with_size_bold.dart';

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  String tempEmail = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Container(
                height: _keyboardIsVisible() ? 0 : height * 0.25,
                width: width,
                child: Row(
                  children: [
                    RoundedTextView(
                      mText: "1",
                      isDoneStage: false,
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
                margin: EdgeInsets.fromLTRB(25, 60, 25, 25),
              ),

              Container(
                  height: height * 0.553,
                  width: width,
                  child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                            child: TextViewWithSizeBold(
                          "Welcome to",
                          fontSize: 35.0,
                          marginHorizontal: 25.0,
                        )),
                      ]),
                      Row(children: [
                        Container(
                          child: TextViewWithSizeBold(
                            "GIN ",
                            fontSize: 35.0,
                            marginHorizontal: 0.0,
                          ),
                          margin: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
                        ),
                        TextViewWithSizeBold(
                          "Finans ",
                          color: Colors.white,
                          fontSize: 40.0,
                          marginHorizontal: 0.0,
                        )
                      ]),
                      TextViewWithSizeBold(
                        "Welcome to The Bank of The Future \nManage and track your accounts on\nthe go",
                        fontSize: 20.0,
                        marginVertical: 20.0,
                        marginHorizontal: 5.0,
                      ),
                      Container(
                        child: Container(
                          child: TextFormField(
                              decoration: new InputDecoration(
                                  labelText: "Email",
                                  prefixIcon: Icon(Icons.mail_outline),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent))),
                              //,suffixIcon: IconButton(icon:Icon(Icons.remove_red_eye))
                              onChanged: (String value) => tempEmail = value,
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (String value) => tempEmail = value),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(10.0))),
                          margin: EdgeInsets.all(10.0),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: new BorderRadius.all(
                                new Radius.circular(10.0))),
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 40.0),
                      ),
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
                            if (!validateEmail(tempEmail)) {
                              final snackBar = SnackBar(
                                  content:
                                      Text('Please enter a valid email id'));
                              Scaffold.of(innerContext).showSnackBar(snackBar);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyLoginSecondPage()),
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
                      /*RaisedButton(
                          onPressed: () {
                            if (!validateEmail(tempEmail)) {

                               final snackBar = SnackBar(content: Text('Please enter a valid email id'));
                               Scaffold.of(context).showSnackBar(snackBar);

                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyLoginSecondPage()),
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
                        ),
                      )*/
                    ],
                  ))
              //Your widget here,
            ],
          )
          //),color: Colors.red,),
          ),
      backgroundColor: Colors.blueAccent,
      //bottomSheet: RaisedButton(color: Colors.red,padding: EdgeInsets.all(5.0),onPressed: (){},child: Container(width: double.infinity,child: Text("next"),padding: EdgeInsets.all(5.0),color: Colors.blue,),),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  bool validateEmail(String value) {
    print(value);
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  bool _keyboardIsVisible() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }
}
