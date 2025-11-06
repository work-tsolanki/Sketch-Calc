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

  List<double> nums = [];
  late var tempnum = '';
  late var calc = '';
  double result = 0;
  dynamic _operator = '';

  // Adds every number to list
  void operatorPressed(){
      nums.add(double.parse(tempnum));
      tempnum = '';
    // print(tempnum);
  }

  // Plus Function
  void calculatePlus(){
    setState(() {
      nums.add(double.parse(tempnum));
      result = nums[0] + nums[1];
      nums.clear();
      tempnum = result.toString();
      calc = result.toString();
    });
  }

  // Minus Function
  void calculateMinus(){
    setState(() {
    nums.add(double.parse(tempnum));
    result = nums[0] - nums[1];
      nums.clear();
      tempnum = result.toString();
      calc = result.toString();
    });
  }

  // Multiply Function
  void calculateMultiply(){
    setState(() {
      nums.add(double.parse(tempnum));
      result = nums[0] * nums[1];
      nums.clear();
      tempnum = result.toString();
      calc = result.toString();
    });
  }

  // Divide Function
  void calculateDivide(){
    setState(() {
      nums.add(double.parse(tempnum));
      result = nums[0] / nums[1];
      nums.clear();
      tempnum = result.toString();
      calc = result.toString();
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
                            //   height: double.infinity,
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
                                nums.clear();
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
                              onPressed: (){
                                // print(_operator);
                                setState(() {
                                  if (calc.isNotEmpty) {
                                    calc = calc.substring(0, calc.length - 1);
                                  }
                                  if (tempnum.isNotEmpty) {
                                    tempnum = tempnum.substring(0, tempnum.length - 1);
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
                              setState(() {
                                if (tempnum.isNotEmpty) {
                                  operatorPressed();
                                }
                                _operator = '/';
                                calc += '/';
                              });
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
                              setState(() {
                                if (tempnum.isNotEmpty) {
                                  operatorPressed();
                                }
                                _operator = '*';
                                calc += '*';
                              });
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
                              setState(() {
                                if (tempnum.isNotEmpty) {
                                  operatorPressed();
                                }
                                _operator = '-';
                                calc += '-';
                              });
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
                              setState(() {
                                if (tempnum.isNotEmpty) {
                                  operatorPressed();
                                }
                                _operator = '+';
                                calc += '+';
                              });
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
                              if (_operator == '+') {
                                // operatorPressed();
                                calculatePlus();
                              }
                              else if (_operator == '-') {
                                // operatorPressed();
                                calculateMinus();
                              }
                              else if (_operator == '*') {
                                // operatorPressed();
                                calculateMultiply();
                              }
                              else if (_operator == '/') {
                                // operatorPressed();
                                calculateDivide();
                              }
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


