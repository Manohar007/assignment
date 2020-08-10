import 'package:flutter/material.dart';
import 'package:flutter_assignment/view/dashview.dart';
import 'package:flutter_assignment/view/rounded_textview.dart';
import 'package:flutter_assignment/view/textview_with_size_bold.dart';

class MyLoginFourPage extends StatefulWidget {
  MyLoginFourPage({Key key}) : super(key: key);

  //final String title;

  @override
  _MyLoginFourPageState createState() => _MyLoginFourPageState();
}

class _MyLoginFourPageState extends State<MyLoginFourPage>
    with SingleTickerProviderStateMixin {
  String tempDateStr = "-Choose Date-", tempTime = "-Choose Time-";
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  List days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  List months = [
    "",
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sept",
    "Oct",
    "Nov",
    "Dec"
  ];

  AnimationController animationController;
  Animation<double> animation;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = Tween<double>(
      begin: 0.0,
      end: 20.0,
    ).animate(animationController);

    animationController.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
          animationController.reverse();
          break;
        case AnimationStatus.dismissed:
          animationController.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
      }
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      key: _scaffoldKey,
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
                      isDoneStage: true,
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: animation.value * 0.5,
                              width: animation.value * 0.5,
                              child: Icon(
                                Icons.insert_invitation,
                                size: 40.0,
                                color: Colors.blueAccent,
                              ),
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(5.0),
                              margin: EdgeInsets.all(25),
                            )
                          ]),
                      Row(children: [
                        Expanded(
                            child: TextViewWithSizeBold(
                          "Schedule Video Call",
                          fontSize: 22.0,
                          color: Colors.white,
                          marginHorizontal: 25.0,
                        )),
                      ]),
                      Row(children: [
                        Expanded(
                            child: TextViewWithSizeBold(
                          "Choose date and time that you preferred. we will send a link via email to make video call on scheduled date and time",
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
                                " Date ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              padding: EdgeInsets.only(left: 5.0, top: 5.0),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                  child: Padding(
                                    child: Text(
                                      tempDateStr,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    padding: EdgeInsets.only(left: 8.0),
                                  ),
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                )),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: new BorderRadius.all(
                                new Radius.circular(10.0))),
                        padding: EdgeInsets.fromLTRB(10.0, 10, 5.0, 10),
                        margin: EdgeInsets.fromLTRB(25.0, 40.0, 25.0, 5.0),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                " Time ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              padding: EdgeInsets.only(left: 5.0, top: 5.0),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        tempTime,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )),
                                  onTap: () {
                                    _selectTime(context);
                                  },
                                )),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: new BorderRadius.all(
                                new Radius.circular(10.0))),
                        padding: EdgeInsets.fromLTRB(10.0, 10, 5.0, 10),
                        margin: EdgeInsets.fromLTRB(25.0, 40.0, 25.0, 5.0),
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
                            /*if (!validateInputeDataFields()) {

                                      final snackBar = SnackBar(content: Text('Please enter a valid email id'));
                                      Scaffold.of(innerContext).showSnackBar(snackBar);

                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyLoginFourPage()),
                                      );
                                    }*/
                          },
                          color: Colors.blueGrey,
                          child: Container(
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            ),
                            padding: EdgeInsets.all(15.0),
                          ),
                        );
                      }))
                    ],
                  ))

              //Your widget here,
            ],
          )
          //),color: Colors.red,),
          ),
      backgroundColor: Colors.blueAccent,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;

        var formattedDate =
            "${days[selectedDate.weekday]},${selectedDate.day}  ${months[selectedDate.month]} ${selectedDate.year}";
        tempDateStr = formattedDate;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked_s != null && picked_s != selectedTime)
      setState(() {
        selectedTime = picked_s;
        tempTime = " ${selectedTime.hour}:${selectedTime.minute} ";
      });
  }
}
