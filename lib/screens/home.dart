
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../widgets/left_bar.dart';
import '../widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _widthController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculater',
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 42,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8),
                        )),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _widthController,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 42,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8),
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                double _h =  double.parse(_heightController.text);
                double _w = double.parse(_widthController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if(_bmiResult > 25){
                    _textResult = "You're over weight";
                  }
                  else if(_bmiResult >= 18.5 && _bmiResult <= 25){
                    _textResult = "You have normal weight";
                  }
                  else {
                     _textResult = "You're under weight";
                  }
                });
              },
              child: Container(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 90,
                  color: accentHexColor,

                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
             Visibility(
               visible: _textResult.isNotEmpty,
               child: Container(
                 child: Text(
                   _textResult,
                   style: TextStyle(
                     fontSize: 32,
                     color: accentHexColor,
                     fontWeight: FontWeight.w400,

                   ),
                 ),
               ),
             ),
            const SizedBox(
              height: 10,
            ),
            const LeftBar(barWidth: 40),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(barWidth: 70),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(barWidth: 40),
            const RighrBar(barWidth: 40),
            const SizedBox(
              height: 40,
            ),
            const RighrBar(barWidth: 40),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
