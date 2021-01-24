import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body:SingleChildScrollView(child: BMIPage()),
          backgroundColor: Color.fromARGB(255, 50, 50, 50),
        ),
      ),
    );
  }
}

class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),

      child: Column(
        children: [
          Heading(),
          Line(),
          SelectGender(),
          Line(),
          SizedBox(height: 20,),
          Parameter(),
          SizedBox(height: 20,),
          CalculateButton(),
        ],
      ),
    );
  }
}


class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 20),
    );
  }
}

class Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
      ),
    );
  }
}

class SelectGender extends StatefulWidget {
  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  static String maleIcon="malewhite";
  String femaleIcon = "femalewhite";
  var maleColor = [0,0,0];
  var femaleColor = [0,0,0];
  static String gender = "male";

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Container(

        child: Column(
          children: [
            Text(
              'What are you?',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FlatButton(
                      onPressed: (){
                        gender="male";

                        setState(() {
                          maleIcon="male";
                          maleColor[0]=160;
                          maleColor[1]=240;
                          maleColor[2]=188;

                          femaleIcon="femalewhite";
                          femaleColor[0]=0;
                          femaleColor[1]=0;
                          femaleColor[2]=0;
                        });

                      },
                      child: CircleAvatar(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Image.asset(
                            'images/$maleIcon.png'
                          ),
                        ),
                        radius: 50,
                        backgroundColor: Color.fromARGB(255, maleColor[0], maleColor[1], maleColor[2]),
                        //backgroundColor: Color.fromARGB(255, 158, 240, 194),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: (){
                        gender="female";

                        setState(() {
                          maleIcon="malewhite";
                          maleColor[0]=0;
                          maleColor[1]=0;
                          maleColor[2]=0;

                          femaleIcon="female";
                          femaleColor[0]=160;
                          femaleColor[1]=240;
                          femaleColor[2]=188;
                        });

                      },
                      child: CircleAvatar(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Image.asset(
                              'images/$femaleIcon.png'
                          ),
                        ),
                        radius: 50,
                        backgroundColor: Color.fromARGB(255, femaleColor[0], femaleColor[1], femaleColor[2]),
                      ),
                    )
                    ,
                  )
                  ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Parameter extends StatefulWidget {

  @override
  _ParameterState createState() => _ParameterState();
}

class _ParameterState extends State<Parameter> {

    static int age = 0;
    static double height = 0;
    static double weight = 0;

  @override
  Widget build(BuildContext context) {
    return (
      Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text('Age (Years)',style: TextStyle(color:Color(0xffa0f0bc) ),),
                 Container(
                  child:  TextField(

                    onChanged: (txtAge){
                      age=int.parse(txtAge);
                    },
                    maxLength: 3,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(

                        color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25,
                    ),
                    decoration: InputDecoration(
                      hintText: '00',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(top: 15,bottom: 0),
                  color: Colors.black,
                ),
              ],

            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text('Height (cm)',style: TextStyle(color:Color(0xffa0f0bc) ),),
                Container(
                  
                  child:  TextField(
                    onChanged: (value){
                      height = double.parse(value);
                    },
                    maxLength: 3,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25,
                    ),
                    decoration: InputDecoration(
                      hintText: '00',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      //errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(top: 15,bottom: 0),
                  color: Colors.black,
                ),
              ],

            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text('Weight (kg)',style: TextStyle(color:Color(0xffa0f0bc) ),),
                Container(
                  child:  TextField(
                    onChanged: (value){
                      weight = double.parse(value);
                    },
                    maxLength: 3,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25,
                    ),
                    decoration: InputDecoration(
                      hintText: '00',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(top: 15,bottom: 0),
                  color: Colors.black,
                ),
              ],

            ),
          ),

        ],
      )
    );
  }
}

class CalculateButton extends StatefulWidget {
  @override
  _CalculateButtonState createState() => _CalculateButtonState();
}

class _CalculateButtonState extends State<CalculateButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FlatButton(
        color: Color(0xffa0f0bc),
        textColor: Colors.black,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blueAccent,
        child: Text(
          "Calculate BMI",
          style: TextStyle(fontSize: 20.0),
        ),

        onPressed:() {
          print(_SelectGenderState.gender);
          // print(_ParameterState.age);
          // print(_ParameterState.height);
          // print(_ParameterState.weight);
          double height = _ParameterState.height;
          double weight = _ParameterState.weight;
          double bmi = (weight/((height/100)*(height/100))).floorToDouble();

          String msg = "";
          String img = "profile.jpeg";
          if (bmi<18.5){
            msg = 'You are Underweight';
            img = 'underweight.jpg';
          }
          else if (bmi>=18.5 && bmi<25.0){
            msg = 'You are Healthy';
            img = 'healthy.png';
          }
          else if (bmi>=25.0 && bmi<30){
            msg = 'You are Oerweight';
            img = 'overweight.png';
          }
          else{
            msg = 'You are Obese';
            img = 'obese.png';
          }

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return BMIShow(bmi: bmi,msg:msg,img:img);
            },
          );
        },
      )
    );
  }
}





class BMIShow extends StatelessWidget {
  final double bmi;
  final String msg;
  final String img;
  BMIShow({Key key,@required this.bmi,this.msg,this.img}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xffa0f0bc),

      shape: RoundedRectangleBorder(
        side: BorderSide(width: 3,color: Colors.black),
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),

      content: Container(
       // color: Colors.black,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BMI : $bmi',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),
            CircleAvatar(backgroundImage: AssetImage('images/$img'),radius: 50,backgroundColor: Colors.white,),
            SizedBox(height: 20,),
            Text(msg,style:TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );;
  }
}





