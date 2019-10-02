import 'package:flutter/material.dart';

import 'labeledRadio.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _wcontroller = TextEditingController();
  final TextEditingController _hcontroller = TextEditingController();
  final TextEditingController _acontroller = TextEditingController();
  double height = 0.0, weight = 0.0, result = 0.0;
  int age = 0;
  String bmr;
  LabeledRadio radiobutton = new LabeledRadio();
  bool _isRadioSelected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('BMR Application'),
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              LabeledRadio(
                label: 'Female',
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                value: false,
                groupValue: _isRadioSelected,
                onChanged: (bool newValue) {
                  setState(() {
                    _isRadioSelected = newValue;
                  });
                },
              ),
              LabeledRadio(
                label: 'Male',
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 10),
                value: true,
                groupValue: _isRadioSelected,
                onChanged: (bool newValue) {
                  setState(() {
                    _isRadioSelected = newValue;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(100, 0, 100, 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Age(year)",
                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: _acontroller,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(100, 0, 100, 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Height(cm)",
                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: _hcontroller,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(100, 0, 100, 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Weight(kg)",
                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: _wcontroller,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(110, 5, 110, 5),
                child: RaisedButton(
                  child: Text("Calculate BMR"),
                  onPressed: _onPress,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(110, 5, 110, 5),
                child: RaisedButton(
                  child: Text("Reset"),
                  onPressed: _onPress1,
                ),
              ),
              Center(
                child: Text("BMR: $bmr"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPress() {
    setState(() {
      weight = double.parse(_wcontroller.text);
      height = double.parse(_hcontroller.text);
      age = int.parse(_acontroller.text);

      if (LabeledRadio().label == 'Female') {
        result = (10 * weight) + (6.25 * height) - (5 * age) - 161;
      } else if (LabeledRadio().label == 'Male') {
        result = (10 * weight) + (6.25 * height) - (5 * age) + 5;
      }
      bmr = format(result);
    });
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  void _onPress1() {
    setState(() {
      _wcontroller.text='';
      _hcontroller.text='';
      _acontroller.text='';
      bmr = '';
    });
  }
}
