import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/route_name.dart';
import '../../utils/routes/utils.dart';
import '../services/session_manager.dart';

class SignUpController with ChangeNotifier{
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;

    notifyListeners();
  }

  void signUp(BuildContext context, String userName, String email, String password)async{

    setLoading(true);

    try{
      auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value){

        SessionController().userId = value.user!.uid.toString();

        ref.child(value.user!.uid.toString()).set({
          'uid': value.user!.uid.toString(),
          'email' : value.user!.email.toString(),
          'userName' : userName,
          'onlineStatus': 'onOne',
          'phone': ' ',
          'profile' : ''
        }).then((value){
          setLoading(false);
          Navigator.pushNamed(context, RouteName.dashBoardScreen);
        }).onError((error, stackTrace){
          setLoading(false);
          Utils.toastMessage(error.toString());
        });


        Utils.toastMessage('User Register Successfully');
      }).onError((error, stackTrace){
        setLoading(false);
        Utils.toastMessage(error.toString());
      });

    }
    catch(e){
      setLoading(false);
      Utils.toastMessage(e.toString());
    }


  }

}