import 'package:flutter/material.dart';
import 'package:kaczyon/core/nav.dart';

import 'on_boarding/on_boarding_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
         Image.asset("assests/images/600f00fb05cb0.png",),
         const  Padding(
            padding:   EdgeInsets.all(20.0),
            child: Text("select your lang ..."),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  AppNav.customNavigator(
                      context: context,
                      screen: OnBoardingScreen(),
                      finish: true,
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey
                    ),
                  ),
                  child: Row(
                    children: [
                      Text("عربى"),
                      SizedBox(width: 10,),
                      Image.asset("assests/images/kuwait.png",),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey
                  ),
                ),
                child: Row(
                  children: [
                    Text("English"),
                    SizedBox(width: 10,),
                    Image.asset("assests/images/usa.png",),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
