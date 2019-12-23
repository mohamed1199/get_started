import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'package:get_started/size_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetStarted(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  Timer _timer;
  int _start = 55;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.screenHeight = MediaQuery.of(context).size.height;
    SizeConfig.screenWidth = MediaQuery.of(context).size.width;
    print(SizeConfig.txtMultiplier);
    print(SizeConfig.WidthMultiplier);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF1C5F96),
            Color(0xFF1074BC),
            Color(0xFF34AAFF),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 2.41 * SizeConfig.WidthMultiplier,
                  top: 1.22 * SizeConfig.HeightMultiplier,
                  bottom: 2.45 * SizeConfig.HeightMultiplier,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 5.43 * SizeConfig.HeightMultiplier, // 30
                  child: _drawAppBar(),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 6.76 * SizeConfig.WidthMultiplier,
                    right: 5.79 * SizeConfig.WidthMultiplier,
                    top: 3.34 * SizeConfig.HeightMultiplier,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _drawHeaderText(),
                        SizedBox(
                          height: 1.11 * SizeConfig.HeightMultiplier,
                        ),
                        _drawDescText(),
                        SizedBox(
                          height: 3.34 * SizeConfig.HeightMultiplier,
                        ),
                        _drawInputNumber(),
                        SizedBox(
                          height: 3.26*SizeConfig.HeightMultiplier,
                        ),
                        _drawCounter(),
                        SizedBox(
                          height: 24.45*SizeConfig.HeightMultiplier,
                        ),
                        _drawButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  Widget _drawAppBar() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: null,
        ),
        Transform.translate(
          offset: Offset(24.15 * SizeConfig.WidthMultiplier, 0.0),
          child: Text(
            'Get Started',
            style: TextStyle(
              color: Colors.white,
              fontSize: 2.56 * SizeConfig.txtMultiplier,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    );
  }

  Widget _drawHeaderText() {
    return Text(
      'Phone Number',
      style: TextStyle(
      fontSize: 2.4 * SizeConfig.txtMultiplier,fontWeight: FontWeight.w500, letterSpacing: 0.3,color: Colors.black,),
    );
  }

  Widget _drawDescText() {
    return Text(
      'Please enter your phone number. We will send you a reset code.',
      style: TextStyle(
        fontSize: 2.2 * SizeConfig.txtMultiplier,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.3,
        color: Colors.grey,
      ),
    );
  }

  Widget _drawInputNumber() {
    return Container(
      width: double.infinity,
      height: 8.83*SizeConfig.HeightMultiplier,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 2.41*SizeConfig.WidthMultiplier,),
          child: Row(
            children: <Widget>[
              Image.asset(
                'images/saudi.jpg',
                width: 8.1*SizeConfig.WidthMultiplier,
                height: 3*SizeConfig.HeightMultiplier,
              ),
              SizedBox(
                width: 0.96*SizeConfig.WidthMultiplier,
              ),
              Text(
                '+966',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 2.3*SizeConfig.txtMultiplier,
                ),
              ),
              SizedBox(
                width: 2.41*SizeConfig.WidthMultiplier,
              ),
              Container(
                width: 0.28*SizeConfig.WidthMultiplier,
                height: 9.23*SizeConfig.HeightMultiplier,
                decoration: BoxDecoration(
                  color: Color(0xFF0073F7),
                ),
              ),
              SizedBox(
                width: 2.4*SizeConfig.WidthMultiplier,
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    fontSize: 2.44*SizeConfig.txtMultiplier,
                  ),
                  decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF0073F7), width: 0.28*SizeConfig.WidthMultiplier,),
      ),
    );
  }

  Widget _drawCounter() {
    return Center(
      child: Text(
        'Redend after $_start seconds',
        style: TextStyle(
          fontSize: 2.3*SizeConfig.txtMultiplier,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _drawButton() {
    return Container(
      width: double.infinity,
      height: 6.8 * SizeConfig.HeightMultiplier,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: [
            Color(0xFF0D9344),
            Color(0xFF48A240),
            Color(0xFF8BC63E),
          ],
        ),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            startTimer();
          },
          splashColor: Colors.white30,
          child: Container(
            height: 6.69 * SizeConfig.HeightMultiplier,
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              'Send Code',
              style: TextStyle(
                fontSize: 2.4 * SizeConfig.txtMultiplier,
                color: Colors.white,
                letterSpacing: 0.3,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
