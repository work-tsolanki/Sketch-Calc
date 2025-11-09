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

  List<BigInt> numbers = [];
  List<String> arithmetic = [];
  late var tempnum = '';
  late var calc = '';
  double result = 0;
  // dynamic _operator = '';
  bool _isButtonEnabled = false;

  final ScrollController _scrollController = ScrollController();

  void _toggleButtonState(bool newValue){
      _isButtonEnabled = newValue;
  }

  // Adds every number to list
  void operatorPressed(String operator){
      if (operator.isNotEmpty || tempnum.isNotEmpty) {
        if (operator.isNotEmpty && tempnum.isNotEmpty){
          arithmetic.add(operator);
          numbers.add(BigInt.parse(tempnum));
          tempnum = '';
        }
        else if (operator.isNotEmpty) {
          arithmetic.add(operator);
        }
        else if (tempnum.isNotEmpty) {
          numbers.add(BigInt.parse(tempnum));
          tempnum = '';
        }
      }
      _toggleButtonState(false);
  }

  void equalsTo(){

    late BigInt checkResult;
    if (tempnum.isNotEmpty) {
      numbers.add(BigInt.parse(tempnum));
    }

    while (numbers.length > 1){
      if (arithmetic.contains('/')){
        int idx = arithmetic.indexOf('/');
        checkResult = (numbers[idx] / numbers[idx+1]) as BigInt;
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
    setState(() {
      calc = '';
      calc += numbers[0].toString();
    });

  }

  @override
  Widget build(BuildContext context) {
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
                      height: 300,
                      child: Card(
                        color: Colors.black,
                        child: Stack(
                          children: [
                            // Image.asset(
                            // 'c_icon/placeholder.png',
                            //   fit: BoxFit.fill,
                            //   height: BigInt.infinity,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  onPressed: (){},
                                  style: ButtonStyle(
                                      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.only(top: 10.0, right: 0.0,))
                                  ),
                                  child: Image.asset(
                                    'c_icon/tools.png',
                                    height: 60,
                                    width: 60,
                                  ),
                                ),
                                TextButton(
                                  onPressed: (){},
                                  style: ButtonStyle(
                                      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.only(top: 10.0, left: 0.0, right: 15.0,))
                                  ),
                                  child: Image.asset(
                                    'c_icon/vertical_dots.png',
                                    height: 60,
                                    width: 60,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                controller: _scrollController,
                                reverse: false,
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
                              setState(() {
                                tempnum+='7';
                                calc += '7';
                                _toggleButtonState(true);
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
                                setState(() {
                                  tempnum+='8';
                                  calc += '8';
                                  _toggleButtonState(true);
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
                                setState(() {
                                  tempnum+='9';
                                  calc += '9';
                                  _toggleButtonState(true);
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
                              setState(() {
                                tempnum+='4';
                                calc += '4';
                                _toggleButtonState(true);
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
                                setState(() {
                                  tempnum+='5';
                                  calc += '5';
                                  _toggleButtonState(true);
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
                                setState(() {
                                  tempnum+='6';
                                  calc += '6';
                                  _toggleButtonState(true);
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
                              setState(() {
                                tempnum+='1';
                                calc += '1';
                                _toggleButtonState(true);
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
                                setState(() {
                                  tempnum+='2';
                                  calc += '2';
                                  _toggleButtonState(true);
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
                                setState(() {
                                  tempnum+='3';
                                  calc += '3';
                                  _toggleButtonState(true);
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
                                    setState(() {
                                      calc = calc.substring(0, calc.length - 1);
                                      arithmetic.add('+');
                                      calc += '+';
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

          backgroundColor: Colors.black,
        );
  }
}


