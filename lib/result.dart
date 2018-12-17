import 'package:flutter/material.dart';
import 'dart:io';

class ResultPage extends StatelessWidget {
  int basePay;
  int gradePay;
  ResultPage({this.basePay, this.gradePay});

  @override
  Widget build(BuildContext context) {
    print("finding result");
    double da = 1.35 * (basePay + gradePay);
    double step1 = (basePay + gradePay) * 2.57;
    double step2 = step1 + (0.03 * step1);
    double step3 = step2 + (0.03 * step2);
    double step4 = step3 + (0.11 * da);
    String temp = step4.round().toString();

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
    } else if (temp.length > 7 && temp.length < 11) {
      temp = temp.substring(0, temp.length - 3) +
          ',' +
          temp.substring(temp.length - 3);
      temp = temp.substring(0, temp.length - 6) +
          ',' +
          temp.substring(temp.length - 6);
      temp = temp.substring(0, temp.length - 9) +
          ',' +
          temp.substring(temp.length - 9);
    }
    String finalSalary = temp;
    print("finalSalary $temp");

    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color(0xFF2232A1),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
              top: -40.0,
              right: -20.0,
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    color: Color(0xFF2E42B3), shape: BoxShape.circle),
              )),
          Positioned(
              top: -90.0,
              left: -40.0,
              child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    color: Color(0xFF2E42B3), shape: BoxShape.circle),
              )),
          Center(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Card(
                elevation: 5.0,
                margin: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Ready for the Results!",
                            style: new TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24.0,
                            )),
                        Container(
                          height: 70.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              shape: BoxShape.circle),
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/money.png"))),
                          ),
                        ),
                        RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(text: "As per"),
                                TextSpan(
                                  text: " 7th Pay Commission ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.0),
                                ),
                                TextSpan(text: "your new salary is.."),
                              ],
                            ),
                          ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "\u20B9",
                                style: new TextStyle(
                                  color: Colors.greenAccent,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24.0,
                                ),
                              ),
                              Text(
                                '$finalSalary',
                                style: new TextStyle(
                                  color: Colors.greenAccent,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 40.0,
                                ),
                              )
                            ],
                          ),
                        
                        RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(text: "The results are only"),
                                TextSpan(
                                  text: " approximate ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.0),
                                ),
                                TextSpan(
                                    text: "and the actual salary might vary."),
                              ],
                            ),
                          ),
                        
                        RaisedButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 90.0, vertical: 10.0),
                          color: Colors.pink,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          onPressed: () {
                            exit(0);
                          },
                          child: Text(
                            "CLOSE",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0),
                          ),
                        )
                      ],
                    ))),
          ))
        ],
      ),
    ));
  }
}
