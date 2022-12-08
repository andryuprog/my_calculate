import 'package:flutter/material.dart';
import 'package:my_calculate/pages/two_pages.dart';
import './widgets/calculator_button.dart';
import './widgets/history_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'my calculate',
      theme: ThemeData(primarySwatch: Colors.orange),
      initialRoute: '/',
      routes: {
        '/': (context) => const CalculatorApp(),
        '/two_pages': (context) => const TwoPages(),
      }
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  late int firstNum;
  late int secondNum;
  late String history = '';
  late String textToDisplay = '';
  late String res;
  late String operation;
  bool isProgress = false;
  bool isClear = false;

  void change() {
    setState(() {
      isClear = !isClear;
    });
  }

  void btnOnClick(String btnVal) async {
    if (btnVal == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnVal == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-$textToDisplay';
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnVal == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == '*' ||
        btnVal == '/') {
      firstNum = int.parse(textToDisplay);
      res = '';
      operation = btnVal;
    } else if (btnVal == '=') {
      setState(() {
        isProgress = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      secondNum = int.parse(textToDisplay);

      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '*') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }
    setState(() {
      isProgress = false;
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
       title: const Text('my calculate'),
        centerTitle: true,
       ),
      body: Container(
          color: Colors.grey[700],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    history,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 36,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                alignment: const Alignment(1.0, 1.0),
                child: isProgress
                    ? const Center(child: CircularProgressIndicator())
                    : Text(
                        textToDisplay,
                        maxLines: 2,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                        ),
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: 'AC',
                    fillColor: Colors.red,
                    textColor: Colors.grey,
                    textSize: 25,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: 'C',
                    fillColor: Colors.lightBlueAccent,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '<',
                    fillColor: Colors.blueAccent,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '/',
                    fillColor: Colors.blueAccent,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '9',
                    fillColor: Colors.orange,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '8',
                    fillColor: Colors.orange,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '7',
                    fillColor: Colors.orange,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '*',
                    fillColor: Colors.blueAccent,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '6',
                    fillColor: Colors.orange,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '5',
                    fillColor: Colors.orange,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '4',
                    fillColor: Colors.orange,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '-',
                    fillColor: Colors.blueAccent,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '3',
                    fillColor: Colors.orange,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '2',
                    fillColor: Colors.orange,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '1',
                    fillColor: Colors.orange,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '+',
                    fillColor: Colors.blueAccent,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '+/-',
                    fillColor: Colors.grey,
                    textColor: Colors.grey,
                    textSize: 25,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '0',
                    fillColor: Colors.orange,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '00',
                    fillColor: Colors.orange,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '=',
                    fillColor: Colors.green,
                    textColor: Colors.grey,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                ],
              ),
              HistoryButton(
                text: 'tap history',
                textSize: 35,
                fillColor: Colors.amber,
                textColor: Colors.orange,
                callback: () {
                  Navigator.pushNamed(context, '/two_pages');
                },
              ),
            ],
          )),
    );
  }
}



