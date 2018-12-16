import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String oldSalary = "0";
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    var myWidth = MediaQuery.of(context).size.width * 0.8;

    void _handleInput(String number) {
      String temp =
          (oldSalary.length > 0) ? oldSalary.replaceAll(",", "") : '0';

      if (number.contains("<")) {
        temp = temp.substring(0, temp.length - 1);
      } else {
        if (temp.length < 7) {
          temp = temp + number;
        }
      }
      temp = (temp.length > 0) ? int.parse(temp).toString() : '0';

      setState(() {
        if (temp.length > 3 && temp.length < 6) {
          temp = temp.substring(0, temp.length - 3) +
              ',' +
              temp.substring(temp.length - 3);
        } else if (temp.length > 5 && temp.length < 8) {
          temp = temp.substring(0, temp.length - 3) +
              ',' +
              temp.substring(temp.length - 3);
          temp = temp.substring(0, temp.length - 6) +
              ',' +
              temp.substring(temp.length - 6);
        }
        oldSalary = temp;
      });
    }

    return new Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment
                    .bottomCenter, // 10% of the width, so there are ten blinds.
                colors: [
                  const Color(0xFFF50057),
                  const Color(0xFFFF5983)
                ], // whitish to gray
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "OLD SALARY AS PER 6th PAY",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "\u20B9",
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24.0,
                                ),
                              ),
                              Text(
                                '$oldSalary',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 40.0,
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width,
                  child: new GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20.0),
                    crossAxisSpacing: 10.0,
                    crossAxisCount: 3,
                    children: <Widget>[
                      NumberText(number: '1', callback: _handleInput),
                      NumberText(number: '2', callback: _handleInput),
                      NumberText(number: '3', callback: _handleInput),
                      NumberText(number: '4', callback: _handleInput),
                      NumberText(number: '5', callback: _handleInput),
                      NumberText(number: '6', callback: _handleInput),
                      NumberText(number: '7', callback: _handleInput),
                      NumberText(number: '8', callback: _handleInput),
                      NumberText(number: '9', callback: _handleInput),
                      NumberText(number: '.', callback: _handleInput),
                      NumberText(number: '0', callback: _handleInput),
                      NumberText(number: '<', callback: _handleInput),
                    ],
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: AnimatedContainer(
                          width: _isLoading?40.0:MediaQuery.of(context).size.width * 0.8,
                          curve: Curves.decelerate,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white,
                          ),
                          duration: Duration(milliseconds: 300),
                          child: _isLoading
                              ? Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                    
                                  ),
                                )
                              : RaisedButton(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 100.0),
                                  child: Text(
                                    _isLoading?"":"CALCULATE",
                                    style: new TextStyle(
                                      color: Color(0xFFF50057),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  onPressed: () {
                                    
                                    
                                    setState(() {
                                      
                                      print("width  = $myWidth");
                                      _isLoading = true;
                                      
                                    });

                                    print("loading");
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      setState(() {
                                        _isLoading = false;
                                        
                                        print("width =$myWidth");
                                      });
                                    });
                                  },
                                ),
                        ))),
              ],
            )));
  }
}

class NumberText extends StatelessWidget {
  final String number;
  final Function(String) callback;
  NumberText({this.number, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            splashColor: Color(0xFFFF5983),
            highlightColor: Color(0xFFFF5983),
            onTap: () {
              print("inkwell");
              callback(number);
            },
            borderRadius: BorderRadius.circular(50.0),
            child: Center(
              child: Text(
                "$number",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 28.0,
                ),
              ),
            )),
      ),
    );
  }
}
