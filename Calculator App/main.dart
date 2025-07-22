import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = '0';
  String _output = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  buttonPressed(String buttonText) {
    if (buttonText == 'c') {
      _output = '0';
      num1 = 0;
      num2 = 0;
      operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/') {
      num1 = double.parse(_output);
      operand = buttonText;
      _output = '0';
    } else if (buttonText == '=') {
      num2 = double.parse(_output);
      switch (operand) {
        case '+':
          _output = (num1 + num2).toString();
          break;
        case '-':
          _output = (num1 - num2).toString();
          break;
        case '*':
          _output = (num1 * num2).toString();
          break;
        case '/':
          _output = (num1 / num2).toString();
          break;
      }

      num1 = 0;
      num2 = 0;
      operand = '';
    } else {
      _output += buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2).
      replaceAll(RegExp(r'\.00$'), '');
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.grey[850],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3, // You can adjust this value for more/less space
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text(
                output,
                style: const TextStyle(fontSize: 48, color: Colors.white),
              ),
            ),
          ),
          const Divider(color: Colors.white54),
          Expanded(
            flex: 7, // Button grid takes the rest of the space
            child: Column(
              children: [
                Row(
                  children: [
                    buildButton('7', Colors.grey[800]!),
                    buildButton('8', Colors.grey[800]!),
                    buildButton('9', Colors.grey[800]!),
                    buildButton('/', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('4', Colors.grey[800]!),
                    buildButton('5', Colors.grey[800]!),
                    buildButton('6', Colors.grey[800]!),
                    buildButton('*', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('1', Colors.grey[800]!),
                    buildButton('2', Colors.grey[800]!),
                    buildButton('3', Colors.grey[800]!),
                    buildButton('-', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('0', Colors.grey[800]!),
                    buildButton('.', Colors.grey[800]!),
                    buildButton('c', Colors.redAccent),
                    buildButton('+', Colors.orange),
                  ],
                ),
                Row(children: [buildButton('=', Colors.green)]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String buttonText, Color buttoncolor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(24),
            backgroundColor: buttoncolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            buttonPressed(buttonText);
          }, // Provide the required onPressed parameter
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ), // Provide the required child parameter
        ),
      ),
    );
  }
}
