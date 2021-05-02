import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _display = "0";
  double _total = 0;
  double _tmp1 = 0;
  double _tmp2 = 0;
  String _op = "";

  void _fixDisplay() {
    _display = _display.replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
  }

  void _clear() {
    _tmp1 = 0;
    _tmp2 = 0;
    _op = "";
    _total = 0;
    setState(() {
      _display = "0";
    });
  }

  void _setTmp(number) {
    if (_op == "") {
      _tmp1 = _tmp1 * 10 + number;
      setState(() {
        _display = _tmp1.toString();
        _fixDisplay();
      });
    } else {
      _tmp2 = _tmp2 * 10 + number;
      setState(() {
        _display = _tmp2.toString();
        _fixDisplay();
      });
    }
  }

  void _setOp(oper) {
    _op = oper;
    setState(() {
      _display = _op;
    });
  }

  void _calc() {
    if (_op == "+") {
      _total = _tmp1 + _tmp2;
    } else if (_op == "-") {
      _total = _tmp1 - _tmp2;
    } else if (_op == "×") {
      _total = _tmp1 * _tmp2;
    } else if (_op == "÷") {
      _total = _tmp1 / _tmp2;
    } else {
      _total = _tmp1;
    }

    setState(() {
      _display = _total.toString();
      _fixDisplay();
    });
    _tmp1 = _total;
    _tmp2 = 0;
    _op = "";
    _total = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text('$_display',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _setTmp(7);
                      },
                      child: const Text("7")),
                ),
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _setTmp(8);
                      },
                      child: const Text("8")),
                ),
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _setTmp(9);
                      },
                      child: const Text("9")),
                ),
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _clear();
                      },
                      child: const Text("C")),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _setTmp(4);
                      },
                      child: const Text("4")),
                ),
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _setTmp(5);
                      },
                      child: const Text("5")),
                ),
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _setTmp(6);
                      },
                      child: const Text("6")),
                ),
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _setOp("÷");
                      },
                      child: const Text("÷")),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _setTmp(1);
                      },
                      child: const Text("1")),
                ),
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _setTmp(2);
                      },
                      child: const Text("2")),
                ),
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _setTmp(3);
                      },
                      child: const Text("3")),
                ),
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _setOp("×");
                      },
                      child: const Text("×")),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _setTmp(0);
                      },
                      child: const Text("0")),
                ),
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _calc();
                      },
                      child: const Text("=")),
                ),
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _setOp("+");
                      },
                      child: const Text("+")),
                ),
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _setOp("-");
                      },
                      child: const Text("-")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
