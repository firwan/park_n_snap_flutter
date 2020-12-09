import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(SnapNPark());

class SnapNPark extends StatefulWidget {
  @override
  _SnapNParkState createState() => _SnapNParkState();
}

class _SnapNParkState extends State<SnapNPark> {
  PickedFile _imageFile;
  ImagePicker _picker = ImagePicker();
  var textParkingLevel = TextEditingController();
  var textLocationLabel = TextEditingController();
  var textEntryLabel = TextEditingController();

  Future _snapImage() async {
    var image = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      _imageFile = image;
      print("_image : $_imageFile");
    });
  }
  //=======end image_picker======

  Widget checkText() {
    return textParkingLevel.text == ""
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Snap N Park"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _imageFile == null ? Colors.orange : null,
                    ),
                    width: double.infinity,
                    margin: EdgeInsets.all(15.0),
                    height: 200,
                    child: _imageFile == null
                        ? Icon(
                            Icons.camera_enhance,
                            color: Colors.grey,
                            size: 50,
                          )
                        : Image.file(File(_imageFile.path)),
                  ),
                  onTap: _snapImage,
                ),
                checkText(),
                SizedBox(
                  height: 10.0,
                ),
                textLocationLabel.text == ""
                    ? TextField(
                        controller: textLocationLabel,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          hintText: "Label on nearest pillar",
                          labelText: "Location Label",
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
                                text: '   Location Label : ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.orange,
                                ),
                              ),
                              TextSpan(
                                text: textLocationLabel.text,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.amberAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                SizedBox(
                  height: 10.0,
                ),
                textEntryLabel.text == ""
                    ? TextField(
                        controller: textEntryLabel,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          hintText: "Entrance or lift label",
                          labelText: "Entry label",
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
                                text: '   Entry Label       : ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.orange,
                                ),
                              ),
                              TextSpan(
                                text: textEntryLabel.text,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.amberAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                Container(
                  width: 20,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      checkText();
                    });
//                    FlutterBeep.beep();

                    print("Parking : ${textParkingLevel.text}");
                    print("Location : ${textLocationLabel.text}");
                    print("Entry : ${textEntryLabel.text}");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green[400],
                    ),
                    alignment: Alignment.center,
                    height: 40,
                    child: Text(
                      "📷 Snap It!",
                      textAlign: TextAlign.center,
                    ),
                    width: double.infinity,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      textParkingLevel.text = "";
                      textLocationLabel.text = "";
                      textEntryLabel.text = "";
                      _imageFile = null;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red[700],
                    ),
                    alignment: Alignment.center,
                    height: 40,
                    child: Text(
                      "Clear",
                      textAlign: TextAlign.center,
                    ),
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ),
//        floatingActionButton: FloatingActionButton.extended(
//          onPressed: () {
//            FlutterBeep.beep();
//          },
//          icon: Icon(
//            Icons.camera,
//          ),
//          label: Text("Snap it"),
//          elevation: 10.0,
//        ),
      ),
      theme: ThemeData.dark(),
    );
  }

//  TextField textFieldLabeling({textLabel: String, hint: String}) {
//    return TextField(
//      textAlign: TextAlign.left,
//      decoration: InputDecoration(
//        hintText: hint,
//        labelText: textLabel,
//        fillColor: Colors.black,
//        labelStyle: TextStyle(
//          fontSize: 15.0,
//          color: Colors.orangeAccent,
//        ),
//      ),
//    );
//  }
}
