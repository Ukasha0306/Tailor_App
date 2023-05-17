import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tailor_app/view_model/services/session_manager.dart';
import '../../utils/routes/route_name.dart';

class SplashServices{

  FirebaseAuth auth = FirebaseAuth.instance;


  void isLogin(BuildContext context){

    final user = auth.currentUser;
    if(user != null){

      SessionController().userId = user.uid.toString();

      Timer(const Duration(seconds: 3), () {
        Navigator.pushNamed(context, RouteName.dashBoardScreen);
      });
    }
    else{
      Timer(const Duration(seconds: 3), () {
        Navigator.pushNamed(context, RouteName.loginScreen);
      });
    }
  }
}