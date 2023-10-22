import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_docheck/Home.dart';
import 'package:to_docheck/Todo.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});


  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  static const String KeyLogin="Login";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wheretogo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Container(
          width: 150,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
             Image(image: AssetImage("assert/Todo.png"))
            ],
          )),

        ),
      );

  }

  void wheretogo() async{
    var sharedpref= await SharedPreferences.getInstance();
    var isLoggedin=sharedpref.getBool(KeyLogin);
    Timer(Duration(seconds: 2), () {
      if(isLoggedin!=null){
        if(isLoggedin){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Todo()));
        }
        else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
        }
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
      }
    });


  }
}
