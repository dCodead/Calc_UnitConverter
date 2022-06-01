import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  /*Here on main I need a stateful widget with a
      fixed tab of 2 choices to click and choose
      between Calc & Unit Converter to switch
      between them simultaneously.
  */
  runApp(MaterialApp(
    home: UnitWidget(),
  ));
}

//Unit Converter widget
class UnitWidget extends StatefulWidget {
  const UnitWidget({Key? key}) : super(key: key);

  @override
  State<UnitWidget> createState() => _UnitWidgetState();
}

class _UnitWidgetState extends State<UnitWidget> {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("inch",style: TextStyle(color: Colors.yellow)),value: "inch"), // 2.54 cm, 0.0254 m, 1/12 ft, 1 inch
    DropdownMenuItem(child: Text("feet",style: TextStyle(color: Colors.yellow)),value: "feet"), // 30.48 cm, 0.3048 m, 1 ft, 12 inch
    DropdownMenuItem(child: Text("cm",style: TextStyle(color: Colors.yellow)),value: "cm"), // 1 cm, 0.01 m, 0.032808399 ft, 0.393701 inch
    DropdownMenuItem(child: Text("m",style: TextStyle(color: Colors.yellow)),value: "m"), // 100 cm, 1 m, 3.28084 ft, 3.28084*12 inch
  ];

  // List decodingList = [[2.3,3.6],(4.0,3.5)];
  String selectedValue= "inch";
  String selectedValue2= "cm";
  double multiplier = 2.54; // inch to centimeter
  double multiplier2 = 1/2.54; // centimeter to inch
  double num=0;
  double num2=0;
  bool firstRun = true;
  TextEditingController txt = TextEditingController();
  TextEditingController txt2 = TextEditingController();



  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text("Unit Converter"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          children: [

            //Drop-down menus for unit-selection
            Row(
              children: [

        DropdownButton<String>(
          items: menuItems,
          dropdownColor: Colors.black26,
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
              if(!firstRun) {
                num2 = result(selectedValue, selectedValue2, num, num2);
                txt2.text = num2.toString();
              }
            });
          },
        ),
        DropdownButton<String>(
          items: menuItems,
          dropdownColor: Colors.black26,
          value: selectedValue2,
          onChanged: (value) {
            setState(() {
              selectedValue2 = value!;
              if(!firstRun){
                num = result(selectedValue2, selectedValue, num2, num);
                txt.text = num.toString();
              }
              //multiplier1 = 1/multiplier2;
            });
          },
        )

          ], // End of Children list
        ),

            //TextFields for input & result
            Row(
              children: [
                Container(
                  width: 150,
                  child: TextField(textDirection: TextDirection.ltr,
                    style: TextStyle(color: Colors.amber),cursorColor: Colors.amber,
                    decoration: const InputDecoration(filled: true, fillColor: Colors.brown,
                      hintText: "Enter number"),
                    keyboardType: TextInputType.number,controller: txt,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,6}'))],onChanged: (value) {
                      setState((){
                        // if to prevent result calculation of deleted number
                        if(value !="") {
                          firstRun = false; // prevent menus from deleting hintText
                          num = double.parse(value);
                          txt2.text =
                              result(selectedValue, selectedValue2, num, num2)
                                  .toString();
                        }
                      });
                    },),
                ),

                // Put divider here

                Container(
                  width: 150,
                  child: TextField(textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.amber),cursorColor: Colors.amber,
                  decoration: const InputDecoration(filled: true, fillColor: Colors.brown,
                    hintText: "Enter number"),
                  keyboardType: TextInputType.number, controller: txt2,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,6}')),],onChanged: (value) {
                    setState((){
                      // if to prevent result calculation of deleted number
                      if(value!="") {
                        firstRun = false; // prevent menus from deleting hintText
                        num2 = double.parse(value);
                        txt.text =
                            result(selectedValue2, selectedValue, num2, num)
                                .toString();
                        // result2 = (value.isNotEmpty)? result2 = value : "Enter a number";
                      }
                    });
                  },)),
              ],

            ),
            //Calculate Button
            // ElevatedButton(onPressed: (){
            //
            // },
            //   child: Text("Calculate"),
            // ),
          ],
        ),
      ),
    );  }




  // Unit converter method
  double result(String val, String val2, double num, double num2){
    // non-numbered variables are the values to convert from to numbered values
    double result;

    if(val==val2) return num;

    return result = (val=="inch")? (val2=="cm")? num*2.54 : (val2=="m")? num*0.0254 : num/12
        : (val=="feet")? (val2=="cm")? num*30.48 : (val2=="m")? num*0.3048 : num*12
        : (val=="cm")? (val2=="inch")? num*0.393701 : (val2=="feet")? num*0.032808399 : num/100
        : (val=="m")? (val2=="feet")? num*3.28084 : (val2=="inch")? num*3.28084*12 : num*100 : 0;

  }
}





//Calculator widget
class CalcWidget extends StatelessWidget {
  const CalcWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Calculator"),
      centerTitle: true,
      backgroundColor: Colors.amber,
    ),
    body: Column(
    children:<Widget>[

    //Clear, (), %, Divide
    Row(
    children: <Widget>[
    FloatingActionButton(onPressed: (){},
      child: Text('C'),
      backgroundColor: Colors.deepOrange,
    ),
    FloatingActionButton(onPressed: (){},
      child: Text('( )'),
      backgroundColor: Colors.cyan,
    ),
    FloatingActionButton(onPressed: (){},
    child: Text('%'),
    backgroundColor: Colors.blue,
    ),
    FloatingActionButton(onPressed: (){},
    child: Text('÷'),
    backgroundColor: Colors.purple
    ),
    ],

    ),
    //7, 8, 9, Multiply
    Row(
        children: <Widget>[
          FloatingActionButton(onPressed: (){},
            child: Text('7'),
            backgroundColor: Colors.black54,
          ),
          FloatingActionButton(onPressed: (){},
            child: Text('8'),
            backgroundColor: Colors.black54,
          ),
          FloatingActionButton(onPressed: (){},
            child: Text('9'),
            backgroundColor: Colors.black54,
          ),
          FloatingActionButton(onPressed: (){},
              child: Text('×'),
              backgroundColor: Colors.amber[700]
          ),
        ],

      ),
    //4, 5, 6, Subtract
    Row(
      children: <Widget>[
      FloatingActionButton(onPressed: (){},
        child: Text('4'),
        backgroundColor: Colors.black54,
      ),
      FloatingActionButton(onPressed: (){},
        child: Text('5'),
        backgroundColor: Colors.black54,
      ),
      FloatingActionButton(onPressed: (){},
        child: Text('6'),
        backgroundColor: Colors.black54,
      ),
      FloatingActionButton(onPressed: (){},
        child: Text('-'),
        backgroundColor: Colors.red[900]
      ),
    ],

    ),
    //1, 2, 3, Add
    Row(
      children: <Widget>[
      FloatingActionButton(onPressed: (){},
        child: Text('1'),
        backgroundColor: Colors.black54,
      ),
      FloatingActionButton(onPressed: (){},
        child: Text('2'),
        backgroundColor: Colors.black54,
      ),
      FloatingActionButton(onPressed: (){},
        child: Text('3'),
        backgroundColor: Colors.black54,
      ),
      FloatingActionButton(onPressed: (){},
        child: Text('+'),
        backgroundColor: Colors.green[900],
      ),
    ],

    ),
    //Sign +/-, 0, decimal point, Equal
    Row(
        children: <Widget>[
        FloatingActionButton(onPressed: (){},
          child: Text('+x/-x'),
          backgroundColor: Colors.black54,
        ),
        FloatingActionButton(onPressed: (){},
         child: Text('0'),
         backgroundColor: Colors.black54,
        ),
        FloatingActionButton(onPressed: (){},
          child: Text('.'),
         backgroundColor: Colors.black54,
        ),
        FloatingActionButton(onPressed: (){},
          child: Text('='),
          backgroundColor: Colors.cyan[900],
        ),
    ],

    ),
    ],

    ),


    );
  }
}

