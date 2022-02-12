import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const buttonSize = 70.0;

  MyHomePage({Key? key}) : super(key: key) {}

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _input = '';
  var _num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                offset: Offset(5.0, 5.0),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 8.0),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock,
                          size: 80,
                          color: Colors.black54,
                        ),
                        Text('กรุณาใส่รหัสผ่าน',
                            style: TextStyle(
                                fontSize: 36.0, color: Colors.black54)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < 6; i++)
                      Container(
                        width: 20.0,
                        height: 20.0,
                        margin: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton(1),
                  buildButton(2),
                  buildButton(3),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton(4),
                  buildButton(5),
                  buildButton(6),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton(7),
                  buildButton(8),
                  buildButton(9),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MyHomePage.buttonSize,
                      height: MyHomePage.buttonSize,
                    ),
                  ),
                  buildButton(0),
                  buildButton(-1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (num == -1) {
            print('Backspace');
            setState(() {
              var length = _input.length;
              _input = _input.substring(0, length - 1);
            });
          } else {
            print('$num');
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //     for (var i = 0; i < _num; i++)
            //       Container(
            //         width: 20.0,
            //         height: 20.0,
            //         margin: EdgeInsets.all(4.0),
            //         decoration: BoxDecoration(
            //           color: Colors.black54,
            //           shape: BoxShape.circle,
            //         ),
            //       ),
            //   ],
            // );
          }
        },
        borderRadius: BorderRadius.circular(MyHomePage.buttonSize / 2),
        child: Container(
          decoration: (num == -1)
              ? null
              : BoxDecoration(
                  border: Border.all(width: 2.0),
                  shape: BoxShape.circle,
                ),
          alignment: Alignment.center,
          width: MyHomePage.buttonSize,
          height: MyHomePage.buttonSize,
          child: (num == -1)
              ? const Icon(Icons.backspace)
              : Text('$num',
                  style: TextStyle(fontSize: 36.0, color: Colors.black54)),
        ),
      ),
    );
  }
}
