import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";
  int _selectedIndex = 1;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateValue(_weightController.text, 0.06);
          _formattedText = "Your Weight on Pluto is $_finalResult";
          break;
        case 1:
          _finalResult = calculateValue(_weightController.text, 0.38);
          _formattedText = "Your Weight on Mars is $_finalResult";
          break;
        case 2:
          _finalResult = calculateValue(_weightController.text, 0.91);
          _formattedText = "Your Weight on Venus is $_finalResult";
          break;
      }
    });
  }

  double calculateValue(String weight, double mult) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * mult;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
     return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Weight on Planet X!",
          style: new TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.lightBlue,
              fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.black38,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              width: 120.0,
              height: 120.0,
            ),
            new Container(
              margin: const EdgeInsets.all(10.0),
              child: new TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  fillColor: Colors.white,
                  labelText: "Enter your weight on Earth!",
                  hintText: "In Pounds!",
                  icon: new Icon(Icons.person),
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(10.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Radio<int>(
                  activeColor: Colors.brown,
                  value: 0,
                  groupValue: radioValue,
                  onChanged: handleRadioValueChanged,
                ),
                new Text(
                  "Pluto",
                  style: new TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                new Radio<int>(
                    activeColor: Colors.deepOrange,
                    value: 1,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged),
                new Text(
                  "Mars",
                  style: new TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                new Radio<int>(
                    activeColor: Colors.yellowAccent,
                    value: 2,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged),
                new Text(
                  "Venus",
                  style: new TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            new Padding(padding: const EdgeInsets.all(20.0)),
            new Center(
              child: new Text(
                _weightController.text.isEmpty
                    ? "Enter Weight"
                    : _formattedText + " kg",
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("About"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.shop),
            title: new Text("Play"),
          ),
        ],
        fixedColor: Colors.deepPurple,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
     _selectedIndex = value;
    });
  }
}
