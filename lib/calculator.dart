import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _calciState createState() => _calciState();
}

class _calciState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ), //Expanded
            Row(
              children: <Widget>[
                customOutlineButton('9'),
                customOutlineButton('8'),
                customOutlineButton('7'),
                customOutlineButton('+'),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton('6'),
                customOutlineButton('5'),
                customOutlineButton('4'),
                customOutlineButton('-'),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton('3'),
                customOutlineButton('2'),
                customOutlineButton('1'),
                customOutlineButton('x'),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton('C'),
                customOutlineButton('0'),
                customOutlineButton('='),
                customOutlineButton('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customOutlineButton(String val) {
    return Expanded(
      child: OutlinedButton(
          onPressed: () {
            btnclicked(val);
          },
          child: Text(
            val,
            style: TextStyle(fontSize: 35.0),
          ),
          //Button padding
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(15),
          )),
    );
  }

  String text = '';
  String res = '';
  late int First;
  late int Last;
  String? opp;
  void btnclicked(String btnvalue) {
    if (btnvalue == 'C') {
      res = '';
      text = '';
      First = 0;
      Last = 0;
    } else if (btnvalue == '+' ||
        btnvalue == '-' ||
        btnvalue == 'x' ||
        btnvalue == '/') {
      First = int.parse(text);
      res = '';
      opp = btnvalue;
    } else if (btnvalue == '=') {
      Last = int.parse(text);
      if (opp == '+') {
        res = (First + Last).toString();
      }
      if (opp == '-') {
        res = (First - Last).toString();
      }
      if (opp == 'x') {
        res = (First * Last).toString();
      }
      if (opp == '/') {
        res = (First / Last).toString();
      }
    } else {
      res = int.parse(text + btnvalue).toString();
    }
    setState(() {
      text = res;
    });
  }
}
