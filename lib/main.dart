import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp()
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<double> numbers = [];
  List<String> arithmetic = [];
  late var tempnum = '';
  late var calc = '';
  double result = 0;
  bool _isButtonEnabled = false;

  void _toggleButtonState(bool newValue){
      _isButtonEnabled = newValue;
  }

  // Adds every number & arithmetic operators to list
  void operatorPressed(String operator){
      if (operator.isNotEmpty || tempnum.isNotEmpty) {
        if (operator.isNotEmpty && tempnum.isNotEmpty){
          arithmetic.add(operator);
          numbers.add(double.parse(tempnum));
          tempnum = '';
        }
        else if (operator.isNotEmpty) {
          arithmetic.add(operator);
        }
        else if (tempnum.isNotEmpty) {
          numbers.add(double.parse(tempnum));
          tempnum = '';
        }
      }
      _toggleButtonState(false);
  }

  void equalsTo() {

    late double checkResult;
    if (tempnum.isNotEmpty) {
      numbers.add(double.parse(tempnum));
    }

    while (numbers.length > 1){
      if (arithmetic.contains('/')){
        int idx = arithmetic.indexOf('/');
        checkResult = numbers[idx] / numbers[idx+1];
        arithmetic.remove('/');
        numbers.removeRange(idx, idx+2);
        numbers.insert(idx, checkResult);
      }
      else if (arithmetic.contains('*')){
        int idx = arithmetic.indexOf('*');
        checkResult = numbers[idx] * numbers[idx+1];
        arithmetic.remove('*');
        numbers.removeRange(idx, idx+2);
        numbers.insert(idx, checkResult);
      }
      else if (arithmetic.contains('+')){
        int idx = arithmetic.indexOf('+');
        checkResult = numbers[idx] + numbers[idx+1];
        arithmetic.remove('+');
        numbers.removeRange(idx, idx+2);
        numbers.insert(idx, checkResult);
      }
      else if (arithmetic.contains('-')){
        int idx = arithmetic.indexOf('-');
        checkResult = numbers[idx] - numbers[idx+1];
        arithmetic.remove('-');
        numbers.removeRange(idx, idx+2);
        numbers.insert(idx, checkResult);
      }
    }
    calc = '';
    tempnum = '';
    setState(() => calc += numbers[0].toString());
  }

  @override
  Widget build(BuildContext context) {
    //---- NEW UI ----
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  // color: Colors.grey[300],
                  height: 200,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0xAAc7c7c7),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    margin: EdgeInsets.only(left: 5, right: 5),
                    // elevation: 5,
                    color: Color(0xFFE7E5F4),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Color(0xFFE7E5F4),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              // Black Top-Left Shadow
                              BoxShadow(
                                color: Color(0xFFAFABCB),
                                blurRadius: 4,
                                spreadRadius: 12,
                                offset: Offset(-4, -4),
                                blurStyle: BlurStyle.normal,
                              ),
                              // White Bottom-Right Shadow
                              BoxShadow(
                                color: Color(0xFFffffff),
                                blurRadius: 10,
                                spreadRadius: 8,
                                offset: Offset(8, 8),
                                blurStyle: BlurStyle.normal,
                              ),
                            ]
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            reverse: true,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12.0, bottom: 6.0),
                              child: Text(
                                '$calc',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontFamily: 'KgNextToMeSketched',
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              indent: 40,
              endIndent: 40,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          setState(() {
                            numbers.clear();
                            arithmetic.clear();
                            tempnum = '';
                            calc = '';
                            result = 0;
                          });
                        },
                        child: SizedBox(
                          // color: Colors.blue[100],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/ac.jpg')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){},
                        child: SizedBox(
                          // color: Colors.blue[100],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/operation_percentage.jpg')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0)
                      ,
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: () {
                          // print(_operator);
                          setState(() {
                            if (calc.isNotEmpty || tempnum.isNotEmpty) {
                              if (calc.isNotEmpty && tempnum.isNotEmpty){
                                calc = calc.substring(0, calc.length - 1);
                                // print(calc.length-1);
                                tempnum = tempnum.substring(0, tempnum.length - 1);
                              }
                              else if (calc.isNotEmpty) {
                                if (RegExp(r'[+-/*]').hasMatch(calc.substring(calc.length-1))){
                                  arithmetic.removeLast();
                                }
                                calc = calc.substring(0, calc.length - 1);
                                _toggleButtonState(true);
                              }
                              else if(tempnum.isNotEmpty) {
                                tempnum = tempnum.substring(0, tempnum.length - 1);
                              }
                            }
                          });
                          // print(_operator);
                        },
                        child: SizedBox(
                          // color: Colors.blue[100],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/back_arrow.jpg')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0)
                      ,
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          if (_isButtonEnabled){
                            operatorPressed('/');
                            setState(() => calc += '/');
                          }
                          else if (!_isButtonEnabled){
                            if (arithmetic.any((op) => calc.substring(calc.length-1, calc.length).contains(op))) {
                              arithmetic.removeLast();
                              setState(() {
                                calc = calc.substring(0, calc.length - 1);
                                arithmetic.add('/');
                                calc += '/';
                              });
                            }
                          }
                        },
                        child: SizedBox(
                          // color: Colors.deepPurple[200],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.deepPurple[200],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/operation_division.jpg')
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          tempnum+='7';
                          setState(() => calc += '7');
                          _toggleButtonState(true);
                        },
                        child: SizedBox(
                          // color: Colors.blue[100],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/number_7.jpg')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          tempnum+='8';
                          setState(() => calc += '8');
                          _toggleButtonState(true);
                        },
                        child: SizedBox(
                          // color: Colors.blue[100],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/number_8.jpg')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding:  WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          tempnum+='9';
                          setState(() => calc += '9');
                          _toggleButtonState(true);
                        },
                        child: SizedBox(
                          // color: Colors.blue[100],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/number_9.jpg')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          if (_isButtonEnabled){
                            operatorPressed('*');
                            setState(() => calc += '*');
                          }
                          else if (!_isButtonEnabled){
                            if (arithmetic.any((op) => calc.substring(calc.length-1, calc.length).contains(op))) {
                              arithmetic.removeLast();
                              setState(() {
                                calc = calc.substring(0, calc.length - 1);
                                arithmetic.add('*');
                                calc += '*';
                              });
                            }
                          }
                        },
                        child: SizedBox(
                          // color: Colors.deepPurple[200],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.deepPurple[200],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/operation_multiply.jpg')
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          tempnum+='4';
                          setState(() => calc += '4');
                          _toggleButtonState(true);
                        },
                        child: SizedBox(
                          // color: Colors.blue[100],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/number_4.jpg')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          tempnum+='5';
                          setState(() => calc += '5');
                          _toggleButtonState(true);
                        },
                        child: SizedBox(
                          // color: Colors.blue[100],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/number_5.jpg')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          tempnum+='6';
                          setState(() => calc += '6');
                          _toggleButtonState(true);
                        },
                        child: SizedBox(
                          // color: Colors.blue[100],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/number_6.jpg')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          if (_isButtonEnabled){
                            operatorPressed('-');
                            setState(() => calc += '-');
                          }
                          else if (!_isButtonEnabled) {
                            if (arithmetic.any((op) => calc.substring(calc.length - 1, calc.length).contains(op))) {
                              arithmetic.removeLast();
                              setState(() {
                                calc = calc.substring(0, calc.length - 1);
                                arithmetic.add('-');
                                calc += '-';
                              });
                            }
                          }
                        },
                        child: SizedBox(
                          // color: Colors.deepPurple[200],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.deepPurple[200],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/operation_minus.jpg')
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          tempnum+='1';
                          setState(() => calc += '1');
                          _toggleButtonState(true);
                        },
                        child: SizedBox(
                          // color: Colors.blue[100],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/number_1.jpg')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          tempnum+='2';
                          setState(() => calc += '2');
                          _toggleButtonState(true);
                        },
                        child: SizedBox(
                          // color: Colors.blue[100],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/number_2.png')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          tempnum+='3';
                          setState(() => calc += '3');
                          _toggleButtonState(true);
                        },
                        child: SizedBox(
                          // color: Colors.blue[100],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/number_3.jpg')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          if (_isButtonEnabled){
                            operatorPressed('+');
                            setState(() => calc += '+');
                          }
                          else if (!_isButtonEnabled){
                            if (arithmetic.any((op) => calc.substring(calc.length-1, calc.length).contains(op))) {
                              arithmetic.removeLast();
                              calc = calc.substring(0, calc.length - 1);
                              arithmetic.add('+');
                              setState(() => calc += '+');
                            }
                          }
                        },
                        child: SizedBox(
                          // color: Colors.deepPurple[200],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.deepPurple[200],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/operation_plus.jpg')
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          setState(() {
                            tempnum+='00';
                            calc += '00';
                          });
                        },
                        child: SizedBox(
                          // color: Colors.blue[100],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/number_00.jpg')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          setState(() {
                            tempnum+='0';
                            calc += '0';
                          });
                        },
                        child: SizedBox(
                          // color: Colors.blue[100],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/number_0.jpg')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          setState(() {
                            tempnum+='.';
                            calc += '.';
                          });
                        },
                        child: SizedBox(
                          // color: Colors.blue[100],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/dot.jpg')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(0),
                          ),
                        ),
                        onPressed: (){
                          equalsTo();
                        },
                        child: SizedBox(
                          // color: Colors.blue[100],
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.only(top: 20),
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            child: Image.asset('c_icon/equals.jpg')
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      backgroundColor: Color(0xFFE7E5F4),
    );


    //---- OLD UI ----
    // return Scaffold(
    //       body: SafeArea(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.end,
    //           children: [
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.stretch,
    //               children: [
    //                 SizedBox(
    //                   // color: Colors.grey[300],
    //                   height: 300,
    //                   child: Card(
    //                     color: Colors.black,
    //                     child: Stack(
    //                       children: [
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.end,
    //                           children: <Widget>[
    //                             TextButton(
    //                               onPressed: (){},
    //                               style: ButtonStyle(
    //                                   padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.only(top: 10.0, right: 0.0,))
    //                               ),
    //                               child: Image.asset(
    //                                 'c_icon/tools.png',
    //                                 height: 60,
    //                                 width: 60,
    //                               ),
    //                             ),
    //                             TextButton(
    //                               onPressed: (){},
    //                               style: ButtonStyle(
    //                                   padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.only(top: 10.0, left: 0.0, right: 15.0,))
    //                               ),
    //                               child: Image.asset(
    //                                 'c_icon/vertical_dots.png',
    //                                 height: 60,
    //                                 width: 60,
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                         Align(
    //                           alignment: Alignment.bottomRight,
    //                           child: SingleChildScrollView(
    //                             scrollDirection: Axis.horizontal,
    //                             reverse: true,
    //                             child: Padding(
    //                               padding: const EdgeInsets.only(right: 12.0, bottom: 6.0),
    //                               child: Text(
    //                                 '$calc',
    //                                 style: TextStyle(
    //                                   color: Colors.white,
    //                                   fontSize: 35,
    //                                   fontFamily: 'KgNextToMeSketched',
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             const Divider(
    //               color: Colors.grey,
    //               indent: 40,
    //               endIndent: 40,
    //             ),
    //             Column(
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8),
    //                       child: TextButton(
    //                         style: ButtonStyle(
    //                           padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                             EdgeInsets.all(0),
    //                           ),
    //                         ),
    //                         onPressed: (){
    //                           setState(() {
    //                             numbers.clear();
    //                             arithmetic.clear();
    //                             tempnum = '';
    //                             calc = '';
    //                             result = 0;
    //                           });
    //                         },
    //                         child: SizedBox(
    //                           // color: Colors.blue[100],
    //                           width: 80,
    //                           height: 80,
    //                           // padding: EdgeInsets.only(top: 20),
    //                           // decoration: BoxDecoration(
    //                           //   color: Colors.blue[100],
    //                           //   borderRadius: BorderRadius.circular(10),
    //                           // ),
    //                           child: Image.asset('c_icon/ac.jpg')
    //                         ),
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0),
    //                       child: TextButton(
    //                           style: ButtonStyle(
    //                             padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                               EdgeInsets.all(0),
    //                             ),
    //                           ),
    //                           onPressed: (){},
    //                           child: SizedBox(
    //                             // color: Colors.blue[100],
    //                             width: 80,
    //                             height: 80,
    //                             // padding: EdgeInsets.only(top: 20),
    //                             // decoration: BoxDecoration(
    //                             //   color: Colors.blue[100],
    //                             //   borderRadius: BorderRadius.circular(10),
    //                             // ),
    //                             child: Image.asset('c_icon/operation_percentage.jpg')
    //                           ),
    //                         ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0)
    //                       ,
    //                       child: TextButton(
    //                           style: ButtonStyle(
    //                             padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                               EdgeInsets.all(0),
    //                             ),
    //                           ),
    //                           onPressed: () {
    //                             // print(_operator);
    //                             setState(() {
    //                               if (calc.isNotEmpty || tempnum.isNotEmpty) {
    //                                 if (calc.isNotEmpty && tempnum.isNotEmpty){
    //                                   calc = calc.substring(0, calc.length - 1);
    //                                   // print(calc.length-1);
    //                                   tempnum = tempnum.substring(0, tempnum.length - 1);
    //                                 }
    //                                 else if (calc.isNotEmpty) {
    //                                   if (RegExp(r'[+-/*]').hasMatch(calc.substring(calc.length-1))){
    //                                     arithmetic.removeLast();
    //                                   }
    //                                     calc = calc.substring(0, calc.length - 1);
    //                                   _toggleButtonState(true);
    //                                 }
    //                                 else if(tempnum.isNotEmpty) {
    //                                   tempnum = tempnum.substring(0, tempnum.length - 1);
    //                                 }
    //                               }
    //                             });
    //                             // print(_operator);
    //                           },
    //                           child: SizedBox(
    //                             // color: Colors.blue[100],
    //                             width: 80,
    //                             height: 80,
    //                             // padding: EdgeInsets.only(top: 20),
    //                             // decoration: BoxDecoration(
    //                             //   color: Colors.blue[100],
    //                             //   borderRadius: BorderRadius.circular(10),
    //                             // ),
    //                             child: Image.asset('c_icon/back_arrow.jpg')
    //                           ),
    //                         ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0)
    //                       ,
    //                       child: TextButton(
    //                         style: ButtonStyle(
    //                           padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                             EdgeInsets.all(0),
    //                           ),
    //                         ),
    //                         onPressed: (){
    //                             if (_isButtonEnabled){
    //                               operatorPressed('/');
    //                               setState(() => calc += '/');
    //                             }
    //                             else if (!_isButtonEnabled){
    //                               if (arithmetic.any((op) => calc.substring(calc.length-1, calc.length).contains(op))) {
    //                                 arithmetic.removeLast();
    //                                 setState(() {
    //                                   calc = calc.substring(0, calc.length - 1);
    //                                   arithmetic.add('/');
    //                                   calc += '/';
    //                                 });
    //                               }
    //                             }
    //                         },
    //                         child: SizedBox(
    //                           // color: Colors.deepPurple[200],
    //                           width: 80,
    //                           height: 80,
    //                           // padding: EdgeInsets.only(top: 20),
    //                           // decoration: BoxDecoration(
    //                           //   color: Colors.deepPurple[200],
    //                           //   borderRadius: BorderRadius.circular(10),
    //                           // ),
    //                           child: Image.asset('c_icon/operation_division.jpg')
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0),
    //                       child: TextButton(
    //                         style: ButtonStyle(
    //                           padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                             EdgeInsets.all(0),
    //                           ),
    //                         ),
    //                         onPressed: (){
    //                             tempnum+='7';
    //                             setState(() => calc += '7');
    //                             _toggleButtonState(true);
    //                         },
    //                         child: SizedBox(
    //                           // color: Colors.blue[100],
    //                           width: 80,
    //                           height: 80,
    //                           // padding: EdgeInsets.only(top: 20),
    //                           // decoration: BoxDecoration(
    //                           //   color: Colors.blue[100],
    //                           //   borderRadius: BorderRadius.circular(10),
    //                           // ),
    //                           child: Image.asset('c_icon/number_7.jpg')
    //                         ),
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0),
    //                       child: TextButton(
    //                           style: ButtonStyle(
    //                             padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                               EdgeInsets.all(0),
    //                             ),
    //                           ),
    //                           onPressed: (){
    //                               tempnum+='8';
    //                               setState(() => calc += '8');
    //                               _toggleButtonState(true);
    //                           },
    //                           child: SizedBox(
    //                             // color: Colors.blue[100],
    //                             width: 80,
    //                             height: 80,
    //                             // padding: EdgeInsets.only(top: 20),
    //                             // decoration: BoxDecoration(
    //                             //   color: Colors.blue[100],
    //                             //   borderRadius: BorderRadius.circular(10),
    //                             // ),
    //                             child: Image.asset('c_icon/number_8.jpg')
    //                           ),
    //                         ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0),
    //                       child: TextButton(
    //                           style: ButtonStyle(
    //                             padding:  WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                               EdgeInsets.all(0),
    //                             ),
    //                           ),
    //                           onPressed: (){
    //                               tempnum+='9';
    //                               setState(() => calc += '9');
    //                               _toggleButtonState(true);
    //                           },
    //                           child: SizedBox(
    //                             // color: Colors.blue[100],
    //                             width: 80,
    //                             height: 80,
    //                             // padding: EdgeInsets.only(top: 20),
    //                             // decoration: BoxDecoration(
    //                             //   color: Colors.blue[100],
    //                             //   borderRadius: BorderRadius.circular(10),
    //                             // ),
    //                             child: Image.asset('c_icon/number_9.jpg')
    //                           ),
    //                         ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0),
    //                       child: TextButton(
    //                         style: ButtonStyle(
    //                           padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                             EdgeInsets.all(0),
    //                           ),
    //                         ),
    //                         onPressed: (){
    //                             if (_isButtonEnabled){
    //                               operatorPressed('*');
    //                               setState(() => calc += '*');
    //                             }
    //                             else if (!_isButtonEnabled){
    //                               if (arithmetic.any((op) => calc.substring(calc.length-1, calc.length).contains(op))) {
    //                                 arithmetic.removeLast();
    //                                 setState(() {
    //                                   calc = calc.substring(0, calc.length - 1);
    //                                 arithmetic.add('*');
    //                                 calc += '*';
    //                                 });
    //                               }
    //                             }
    //                         },
    //                         child: SizedBox(
    //                           // color: Colors.deepPurple[200],
    //                           width: 80,
    //                           height: 80,
    //                           // padding: EdgeInsets.only(top: 20),
    //                           // decoration: BoxDecoration(
    //                           //   color: Colors.deepPurple[200],
    //                           //   borderRadius: BorderRadius.circular(10),
    //                           // ),
    //                           child: Image.asset('c_icon/operation_multiply.jpg')
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0),
    //                       child: TextButton(
    //                         style: ButtonStyle(
    //                           padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                             EdgeInsets.all(0),
    //                           ),
    //                         ),
    //                         onPressed: (){
    //                             tempnum+='4';
    //                             setState(() => calc += '4');
    //                             _toggleButtonState(true);
    //                         },
    //                         child: SizedBox(
    //                           // color: Colors.blue[100],
    //                           width: 80,
    //                           height: 80,
    //                           // padding: EdgeInsets.only(top: 20),
    //                           // decoration: BoxDecoration(
    //                           //   color: Colors.blue[100],
    //                           //   borderRadius: BorderRadius.circular(10),
    //                           // ),
    //                           child: Image.asset('c_icon/number_4.jpg')
    //                         ),
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0),
    //                       child: TextButton(
    //                           style: ButtonStyle(
    //                             padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                               EdgeInsets.all(0),
    //                             ),
    //                           ),
    //                           onPressed: (){
    //                               tempnum+='5';
    //                               setState(() => calc += '5');
    //                               _toggleButtonState(true);
    //                           },
    //                           child: SizedBox(
    //                             // color: Colors.blue[100],
    //                             width: 80,
    //                             height: 80,
    //                             // padding: EdgeInsets.only(top: 20),
    //                             // decoration: BoxDecoration(
    //                             //   color: Colors.blue[100],
    //                             //   borderRadius: BorderRadius.circular(10),
    //                             // ),
    //                             child: Image.asset('c_icon/number_5.jpg')
    //                           ),
    //                         ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0),
    //                       child: TextButton(
    //                           style: ButtonStyle(
    //                             padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                               EdgeInsets.all(0),
    //                             ),
    //                           ),
    //                           onPressed: (){
    //                               tempnum+='6';
    //                               setState(() => calc += '6');
    //                               _toggleButtonState(true);
    //                           },
    //                           child: SizedBox(
    //                             // color: Colors.blue[100],
    //                             width: 80,
    //                             height: 80,
    //                             // padding: EdgeInsets.only(top: 20),
    //                             // decoration: BoxDecoration(
    //                             //   color: Colors.blue[100],
    //                             //   borderRadius: BorderRadius.circular(10),
    //                             // ),
    //                             child: Image.asset('c_icon/number_6.jpg')
    //                           ),
    //                         ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0),
    //                       child: TextButton(
    //                         style: ButtonStyle(
    //                           padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                             EdgeInsets.all(0),
    //                           ),
    //                         ),
    //                         onPressed: (){
    //                             if (_isButtonEnabled){
    //                               operatorPressed('-');
    //                               setState(() => calc += '-');
    //                             }
    //                             else if (!_isButtonEnabled) {
    //                               if (arithmetic.any((op) => calc.substring(calc.length - 1, calc.length).contains(op))) {
    //                                 arithmetic.removeLast();
    //                                 setState(() {
    //                                   calc = calc.substring(0, calc.length - 1);
    //                                   arithmetic.add('-');
    //                                   calc += '-';
    //                                 });
    //                               }
    //                             }
    //                         },
    //                         child: SizedBox(
    //                           // color: Colors.deepPurple[200],
    //                           width: 80,
    //                           height: 80,
    //                           // padding: EdgeInsets.only(top: 20),
    //                           // decoration: BoxDecoration(
    //                           //   color: Colors.deepPurple[200],
    //                           //   borderRadius: BorderRadius.circular(10),
    //                           // ),
    //                           child: Image.asset('c_icon/operation_minus.jpg')
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0),
    //                       child: TextButton(
    //                         style: ButtonStyle(
    //                           padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                             EdgeInsets.all(0),
    //                           ),
    //                         ),
    //                         onPressed: (){
    //                             tempnum+='1';
    //                             setState(() => calc += '1');
    //                             _toggleButtonState(true);
    //                         },
    //                         child: SizedBox(
    //                           // color: Colors.blue[100],
    //                           width: 80,
    //                           height: 80,
    //                           // padding: EdgeInsets.only(top: 20),
    //                           // decoration: BoxDecoration(
    //                           //   color: Colors.blue[100],
    //                           //   borderRadius: BorderRadius.circular(10),
    //                           // ),
    //                           child: Image.asset('c_icon/number_1.jpg')
    //                         ),
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0),
    //                       child: TextButton(
    //                           style: ButtonStyle(
    //                             padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                               EdgeInsets.all(0),
    //                             ),
    //                           ),
    //                           onPressed: (){
    //                               tempnum+='2';
    //                               setState(() => calc += '2');
    //                               _toggleButtonState(true);
    //                             },
    //                           child: SizedBox(
    //                             // color: Colors.blue[100],
    //                             width: 80,
    //                             height: 80,
    //                             // padding: EdgeInsets.only(top: 20),
    //                             // decoration: BoxDecoration(
    //                             //   color: Colors.blue[100],
    //                             //   borderRadius: BorderRadius.circular(10),
    //                             // ),
    //                             child: Image.asset('c_icon/number_2.png')
    //                           ),
    //                         ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0),
    //                       child: TextButton(
    //                           style: ButtonStyle(
    //                             padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                               EdgeInsets.all(0),
    //                             ),
    //                           ),
    //                           onPressed: (){
    //                               tempnum+='3';
    //                               setState(() => calc += '3');
    //                               _toggleButtonState(true);
    //                             },
    //                           child: SizedBox(
    //                             // color: Colors.blue[100],
    //                             width: 80,
    //                             height: 80,
    //                             // padding: EdgeInsets.only(top: 20),
    //                             // decoration: BoxDecoration(
    //                             //   color: Colors.blue[100],
    //                             //   borderRadius: BorderRadius.circular(10),
    //                             // ),
    //                             child: Image.asset('c_icon/number_3.jpg')
    //                           ),
    //                         ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0),
    //                       child: TextButton(
    //                         style: ButtonStyle(
    //                           padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                             EdgeInsets.all(0),
    //                           ),
    //                         ),
    //                         onPressed: (){
    //                             if (_isButtonEnabled){
    //                               operatorPressed('+');
    //                               setState(() => calc += '+');
    //                             }
    //                             else if (!_isButtonEnabled){
    //                               if (arithmetic.any((op) => calc.substring(calc.length-1, calc.length).contains(op))) {
    //                                 arithmetic.removeLast();
    //                                   calc = calc.substring(0, calc.length - 1);
    //                                   arithmetic.add('+');
    //                                   setState(() => calc += '+');
    //                               }
    //                             }
    //                         },
    //                         child: SizedBox(
    //                           // color: Colors.deepPurple[200],
    //                           width: 80,
    //                           height: 80,
    //                           // padding: EdgeInsets.only(top: 20),
    //                           // decoration: BoxDecoration(
    //                           //   color: Colors.deepPurple[200],
    //                           //   borderRadius: BorderRadius.circular(10),
    //                           // ),
    //                           child: Image.asset('c_icon/operation_plus.jpg')
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
    //                       child: TextButton(
    //                         style: ButtonStyle(
    //                           padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                             EdgeInsets.all(0),
    //                           ),
    //                         ),
    //                         onPressed: (){
    //                           setState(() {
    //                             tempnum+='00';
    //                             calc += '00';
    //                           });
    //                         },
    //                         child: SizedBox(
    //                           // color: Colors.blue[100],
    //                           width: 80,
    //                           height: 80,
    //                           // padding: EdgeInsets.only(top: 20),
    //                           // decoration: BoxDecoration(
    //                           //   color: Colors.blue[100],
    //                           //   borderRadius: BorderRadius.circular(10),
    //                           // ),
    //                           child: Image.asset('c_icon/number_00.jpg')
    //                         ),
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
    //                       child: TextButton(
    //                           style: ButtonStyle(
    //                             padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                               EdgeInsets.all(0),
    //                             ),
    //                           ),
    //                           onPressed: (){
    //                             setState(() {
    //                               tempnum+='0';
    //                               calc += '0';
    //                             });
    //                           },
    //                           child: SizedBox(
    //                             // color: Colors.blue[100],
    //                             width: 80,
    //                             height: 80,
    //                             // padding: EdgeInsets.only(top: 20),
    //                             // decoration: BoxDecoration(
    //                             //   color: Colors.blue[100],
    //                             //   borderRadius: BorderRadius.circular(10),
    //                             // ),
    //                             child: Image.asset('c_icon/number_0.jpg')
    //                           ),
    //                         ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
    //                       child: TextButton(
    //                           style: ButtonStyle(
    //                             padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                               EdgeInsets.all(0),
    //                             ),
    //                           ),
    //                           onPressed: (){
    //                             setState(() {
    //                               tempnum+='.';
    //                               calc += '.';
    //                             });
    //                           },
    //                           child: SizedBox(
    //                             // color: Colors.blue[100],
    //                             width: 80,
    //                             height: 80,
    //                             // padding: EdgeInsets.only(top: 20),
    //                             // decoration: BoxDecoration(
    //                             //   color: Colors.blue[100],
    //                             //   borderRadius: BorderRadius.circular(10),
    //                             // ),
    //                             child: Image.asset('c_icon/dot.jpg')
    //                           ),
    //                         ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
    //                       child: TextButton(
    //                         style: ButtonStyle(
    //                           padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    //                             EdgeInsets.all(0),
    //                           ),
    //                         ),
    //                         onPressed: (){
    //                           equalsTo();
    //                         },
    //                         child: SizedBox(
    //                           // color: Colors.blue[100],
    //                           width: 80,
    //                           height: 80,
    //                           // padding: EdgeInsets.only(top: 20),
    //                           // decoration: BoxDecoration(
    //                           //   color: Colors.blue[100],
    //                           //   borderRadius: BorderRadius.circular(10),
    //                           // ),
    //                           child: Image.asset('c_icon/equals.jpg')
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //
    //       backgroundColor: Colors.black,
    //     );
  }
}


