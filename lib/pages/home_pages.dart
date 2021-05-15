import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiresult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cal.png',
              width: 20,
            ),
            SizedBox(width: 5),
            Text(
              'BMI Calculator',
              style: GoogleFonts.poppins(
                color: mainHexColor,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: accentHexColor,
        elevation: 0,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: accentHexColor,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
              child: Column(children: [
                SizedBox(height: 40),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 130,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            TextField(
                                cursorColor: Colors.black,
                                textAlign: TextAlign.center,
                                controller: _heightController,
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: mainHexColor,
                                ),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Height',
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 37,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black54))),
                            Text(
                              'in centimeters',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 130,
                        child: Column(
                          children: [
                            TextField(
                                cursorColor: Colors.black,
                                textAlign: TextAlign.center,
                                controller: _weightController,
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: mainHexColor,
                                ),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Weight',
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 37,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black54),
                                )),
                            Text(
                              'in kilograms',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ]),
                SizedBox(height: 60),
                OutlinedButton(
                  onPressed: () {
                    FocusScope.of(context)
                        .unfocus(); //dismiss keyboard when pressed
                    double _h = double.parse(_heightController.text);
                    double _w = double.parse(_weightController.text);
                    double _hcm = _h / 100;
                    setState(() {
                      _bmiresult = _w / (_hcm * _hcm);
                      if (_bmiresult >= 30) {
                        _textResult = "You\'re obese";
                      } else if (_bmiresult >= 25 && _bmiresult <= 29.9) {
                        _textResult = "You\'re normal weight";
                      } else if (_bmiresult >= 18.5 && _bmiresult <= 24.9) {
                        _textResult = "You\'re normal weight";
                      } else {
                        _textResult = "You\'re underweight";
                      }
                    });
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Calculate',
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                        color: mainHexColor),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    _weightController.clear();
                    _heightController.clear();
                  },
                  child: Text(
                    'reset',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 30),
              ]),
            ),
            SizedBox(height: 20),
            Container(
              child: Visibility(
                visible: _textResult.isNotEmpty,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'Your BMI: ',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: accentHexColor),
                      ),
                      Container(
                        child: Text(
                          _bmiresult.toStringAsFixed(2),
                          style: GoogleFonts.poppins(
                              fontSize: 75, color: accentHexColor),
                        ),
                      ),
                      Text(
                        _textResult,
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: accentHexColor),
                      ),
                      SizedBox(height: 10),
                      Image.asset(
                        'assets/book.png',
                        width: 20,
                      ),
                      Text(
                        "BMI Categories:\n\nUnderweight = <18.5\nNormal weight = 18.5–24.9\nOverweight = 25–29.9\nObesity = BMI of 30 or greater",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.white60),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
