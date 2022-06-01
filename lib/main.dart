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
    DropdownMenuItem(child: Text("Inch"),value: "Inch"),
    DropdownMenuItem(child: Text("Mile"),value: "Mile"),
    DropdownMenuItem(child: Text("Feet"),value: "Feet"),
    DropdownMenuItem(child: Text("cm"),value: "cm"),
    DropdownMenuItem(child: Text("m"),value: "m"),
    DropdownMenuItem(child: Text("m2(squared)"),value: "m2(squared)"),
    DropdownMenuItem(child: Text("m3(cubed)"),value: "m3(cubed"),
  ];
  String selectedValue= "Inch";
  String selectedValue2= "m";

  double num1=0;
  double num2=0;

  Widget build(BuildContext context) {
    return Scaffold(
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
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
            });
          },
        ),
        DropdownButton<String>(
          items: menuItems,
          value: selectedValue2,
          onChanged: (value) {
            setState(() {
              selectedValue2 = value!;
            });
          },
        )

          ], // End of Children list
        ),

            //TextFields for input
            Row(
              children: [
                Container(
                  width: 150,
                  child: TextField(textDirection: TextDirection.ltr,decoration: const InputDecoration(labelText: "Enter number"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,6}'))],onChanged: (value) {
                    setState((){
                      num1 = value as double;
                    });
                    },),
                ),
                Container(
                  width: 150,
                  child: TextField(textDirection: TextDirection.ltr,decoration: const InputDecoration(labelText: "Enter number"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,6}')),],onChanged: (value) {
                    setState((){
                      num2 = value as double;
                    });
                  },)),
              ],

            ),
            //Calculate Button
            ElevatedButton(onPressed: (){},
              child: Text("Calculate"),
            ),
          ],
        ),
      ),
    );  }
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

