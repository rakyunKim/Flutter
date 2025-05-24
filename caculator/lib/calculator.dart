import 'package:caculator/circle_button.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

int? firstOperand;
String? operator;
int? secondOperand;
dynamic result;

void numberTapped(int tappedNumber){
  if (firstOperand == null){
    setState(() {
      firstOperand = tappedNumber;
    });
    return;
  }
  if(operator == null) {
    setState(() {
      firstOperand = int.parse("$firstOperand$tappedNumber");
    });
    return;
  }
  if (secondOperand == null) {
    setState(() {
      secondOperand = tappedNumber;
    });
    return ;
  }
  setState(() {
    secondOperand = int.parse("$secondOperand$tappedNumber");
  });
}
void  clearNumber() {
  setState(() {
    firstOperand = null;
    operator = null;
    secondOperand = null;
    result = null;
  });
}

void operatorTapped(String tappedOperator){
  setState(() {
    operator = tappedOperator;
  });
}

String showText() {
  if (result != null){
    return "$result";
  }
  if (secondOperand != null){
    return "$firstOperand$operator$secondOperand";
  }
  if (operator != null) {
    return "$firstOperand$operator";
  }
  if (firstOperand != null) {
    return "$firstOperand";
  }
  return "0";
}

void  calculateMethod() {
  if (firstOperand == null || secondOperand == null) {
    return ;
  }
  if (operator == "+") {
    plusNumber();
    return ;
  }
  if (operator == "-") {
    minusNumber();
    return ;
  }
  if (operator == "x") {
    multiplyNumber();
    return ;
  }
  if (operator == "%") {
    didveNumber();
    return ;
  }
}
void plusNumber() {
  setState(() {
    result = firstOperand! + secondOperand!;
  });

}
void minusNumber() {
  setState(() {
    result = firstOperand! - secondOperand!;
  });
}
void multiplyNumber() {
  setState(() {
    result = firstOperand! * secondOperand!;
  });
}
void didveNumber() {
  setState(() {
    result = firstOperand! / secondOperand!;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200), 
        child: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: null,
        flexibleSpace: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
            child: Text(
              showText(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
             ),
          ),
         ),
        )
       ),
       backgroundColor: Colors.black,
        body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                  CircleButton(padNumber: "7", onTap: () => numberTapped(7)),
                  CircleButton(padNumber: "8", onTap: () => numberTapped(8)),
                  CircleButton(padNumber: "9", onTap: () => numberTapped(9)),
                  CircleButton(
                    padNumber: "%", 
                    onTap: () => operatorTapped("%"),
                    color: Colors.orange,
                    ),
              ]
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                  CircleButton(padNumber: "4", onTap: () => numberTapped(4)),
                  CircleButton(padNumber: "5", onTap: () => numberTapped(5)),
                  CircleButton(padNumber: "6", onTap: () => numberTapped(6)),
                  CircleButton(
                    padNumber: "x", 
                    onTap: () => operatorTapped("x"),
                    color: Colors.orange,
                    ),
              ]
            ),
            SizedBox(
              height: 20,
            ),
           Row(
              children: [
                  CircleButton(padNumber: "1", onTap: () => numberTapped(1)),
                  CircleButton(padNumber: "2", onTap: () => numberTapped(2)),
                  CircleButton(padNumber: "3", onTap: () => numberTapped(3)),
                  CircleButton(
                    padNumber: "-", 
                    onTap: () => operatorTapped("-"),
                    color: Colors.orange,
                    ),
              ]
            ),
            SizedBox(
              height: 20,
            ),
           Row(
              children: [
                  CircleButton(
                    padNumber: "C", 
                    onTap: () => clearNumber(),
                    color: Colors.grey,
                    ),
                  CircleButton(padNumber: "0", onTap: () => numberTapped(0)),
                  CircleButton(
                    padNumber: "=", 
                    onTap: () => calculateMethod(),
                    color: Colors.orange,
                    ),
                  CircleButton(
                    padNumber: "+", 
                    onTap: () => operatorTapped("+"),
                    color: Colors.orange,
                    ),
              ]
            ),
          ]
        ),
      ),
    );
  }
}