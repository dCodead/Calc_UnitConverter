import 'package:flutter/material.dart';

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
class UnitWidget extends StatelessWidget{
  const UnitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
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
              // children: [
              //   DropdownButton(items: [
              //     DropdownMenuItem(child: Text("Inch")),
              //     DropdownMenuItem(child: Text("Mile")),
              //     DropdownMenuItem(child: Text("Feet")),
              //     DropdownMenuItem(child: Text("cm")),
              //     DropdownMenuItem(child: Text("m")),
              //     DropdownMenuItem(child: Text("m2(squared)")),
              //     DropdownMenuItem(child: Text("m3(cubed)")),
              //     DropdownMenuItem(child: Text("Inch")),
              //     DropdownMenuItem(child: Text("Inch")),
              //     DropdownMenuItem(child: Text("Inch")),
              //     DropdownMenuItem(child: Text("Inch")),
              //
              //   ], onChanged:(){},),
              // ],
            ),

            //TextFields for input
            Row(


            ),
            //Calculate Button
            ElevatedButton(onPressed: (){},
                child: Text("Calculate"),
            ),
          ],
        ),
      ),
    );
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

