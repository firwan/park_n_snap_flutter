import 'package:flutter/material.dart';

class TextMethod {
  var textEditLabel = TextEditingController() ;
  String labelText;

  textMethod({this.textEditLabel, this.labelText, });

  return textEditLabel.text == ""
  ? TextField(
  controller: textParkingLevel,
  textAlign: TextAlign.left,
  decoration: InputDecoration(
  hintText: "Floor you park your vehicle",
  labelText: "Parking Level",
  fillColor: Colors.black,
  labelStyle: TextStyle(
  fontSize: 15.0,
  color: Colors.orangeAccent,
  ),
  ),
  )
      : Container(
  height: 50,
  alignment: Alignment.centerLeft,
  child: RichText(
  text: TextSpan(
  children: [
  TextSpan(
  text: '   Your Parking    : ',
  style: TextStyle(
  fontSize: 20,
  color: Colors.orange,
  ),
  ),
  TextSpan(
  text: textParkingLevel.text,
  style: TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  color: Colors.amberAccent,
  ),
  ),
  ],
  ),
  ),
  );
}

Widget checkText() {
  return textEditLabel.text == ""
      ? TextField(
          controller: textParkingLevel,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: "Floor you park your vehicle",
            labelText: "Parking Level",
            fillColor: Colors.black,
            labelStyle: TextStyle(
              fontSize: 15.0,
              color: Colors.orangeAccent,
            ),
          ),
        )
      : Container(
          height: 50,
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '   Your Parking    : ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.orange,
                  ),
                ),
                TextSpan(
                  text: textParkingLevel.text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.amberAccent,
                  ),
                ),
              ],
            ),
          ),
        );
}
