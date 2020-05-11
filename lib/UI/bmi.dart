import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }
}

class BmiState extends State<Bmi> {
  final TextEditingController _agecontroller = new TextEditingController();
  final TextEditingController _weightcontroller = new TextEditingController();
  final TextEditingController _heightcontroller = new TextEditingController();
  double _result = 0.0;
  String _resultString = "";
  int col = 1;
  int i = 1;
  void _calculate() {
    setState(() {
      double height = double.parse(_heightcontroller.text);
      double weight = double.parse(_weightcontroller.text);

      if (_agecontroller.toString().isNotEmpty &&
          _weightcontroller.toString().isNotEmpty &&
          _heightcontroller.toString().isNotEmpty) {
        _result = weight / (height * height);
        if (_result < 16) {
          _resultString = "Sever Thinness(Bhagwaan ko hello khna meri traf se";
          col = 0;
        } else if (_result >= 16 && _result < 18.5) {
          _resultString = "Moderate/Mild Thinness(Khuch khaa peele bhen/bhai";
          col = 0;
        } else if (_result >= 18.5 && _result < 25) {
          _resultString = "Normal hai naa le tension";
          col = 1;
        } else if (_result >= 25 && _result < 30) {
          _resultString = "Thoda sa overweight hai yaar.";
          col = 0;
        } else {
          _resultString = "Obese(GYM Vym jaao yaar)";
          col = 0;
        }
      } else if(_agecontroller.toString().isEmpty &&
          _weightcontroller.toString().isEmpty &&
          _heightcontroller.toString().isEmpty) {
        _resultString = "Please enter the values";
      }

      ;
    });
  }
  void _erase(){
    _weightcontroller.clear();
    _agecontroller.clear();
    _heightcontroller.clear();
    _resultString = " "; 
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.purple.shade900,
      ),
      backgroundColor: Colors.white,
      body: new Container(
          alignment: Alignment.topCenter,
          child: new ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              new Padding(padding: new EdgeInsets.all(10.0)),
              new Image.asset('images/bmilogo.png', height: 90, width: 90),
              new Container(
                  margin: new EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  height: 250.0,
                  decoration: new BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10.5)),
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new TextField(
                            controller: _agecontroller,
                            decoration: new InputDecoration(
                                labelText: "AGE",
                                icon: Icon(Icons.person_outline))),
                        new TextField(
                            controller: _heightcontroller,
                            decoration: new InputDecoration(
                                labelText: "Height",
                                hintText: "in meter",
                                icon: Icon(Icons.trending_up))),
                        new TextField(
                            controller: _weightcontroller,
                            decoration: new InputDecoration(
                                labelText: "Weight",
                                hintText: "in kgs",
                                icon: Icon(Icons.compare_arrows))),
                        new Padding(padding: new EdgeInsets.all(5.0)),
                        new Center(
                            child: new RaisedButton(
                          onPressed: _calculate,
                          onLongPress: _erase,
                          color: Colors.purple.shade900,
                          child: new Text("Calculate",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 15)),
                        ))
                      ])),
              //form end here
              new Padding(padding: new EdgeInsets.all(5.0)),
              new Center(
                  child: new Text("Your BMI is $_result",
                      style: new TextStyle( 
                          color: Colors.lightBlue,
                          fontStyle: FontStyle.italic,
                          fontSize: 20))),
              new Padding(padding: new EdgeInsets.all(40)),
              new Center(
                  child: new Text(
                _resultString,
                style: TextStyle(
                    color: col == 0 ? Colors.red : Colors.lightBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              )),
              new Container(
                alignment: Alignment.bottomLeft,
                child: new Text("Long press to clear values"),
              )
            ],
          )),
    );
  }
}
