import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tailor_app/view/login/login_screen.dart';
import 'dart:io';
import '../../../resources/color.dart';
import '../../../resources/components/input_text_field.dart';
import '../../../utils/routes/utils.dart';
import '../../../view_model/services/session_manager.dart';

class ProfileController with ChangeNotifier{

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final nameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();


  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;


  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value){
    _loading =  value;
    notifyListeners();
  }


  final picker = ImagePicker();

  XFile? _image;
  XFile? get image => _image;

  Future pickGalleryImage(BuildContext context)async{
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if(pickedImage !=null){
      _image = XFile(pickedImage.path);
      notifyListeners();
      uploadImage(context);

    }
  }

  Future pickCameraImage(BuildContext context) async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if(pickedImage != null){
      _image = XFile(pickedImage.path);
      notifyListeners();
      uploadImage(context);
    }
  }



  void pickImage(context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: SizedBox(
              height: 130,
              child: Column(
                children: [
                  ListTile(
                    onTap: (){
                      pickCameraImage(context);
                      Navigator.pop(context);
                    },
                    title: const Text('Camera'),
                    leading:const Icon(Icons.camera, color: AppColors.primaryIconColor,),
                  ),
                  ListTile(
                    onTap: (){
                      pickGalleryImage(context);
                      Navigator.pop(context);
                    },
                    title: const Text('Gallery'),
                    leading:const Icon(Icons.image, color: AppColors.primaryIconColor,),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


  void uploadImage(BuildContext context)async{

    setLoading(true);

    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref('/profileImage${SessionController().userId}');
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image!.path).absolute);

    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    ref.child(SessionController().userId.toString()).update({
      'profile' : newUrl.toString()
    }).then((value){
      Utils.toastMessage('Profile Updated');
      setLoading(false);
      _image = null ;
    }).onError((error, stackTrace){
      setLoading(false);
      Utils.toastMessage(error.toString());

    });
  }


  Future<void> showUserNameDialog(BuildContext context, String name){

    nameController.text = name;
    return showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: const Center(child: Text('Update username')),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InputTextField(
                      myController: nameController,
                      focusNode: nameFocusNode,
                      keyBoardType: TextInputType.text,
                      obscureText: false,
                      hint: 'Enter Name',
                      onFieldSubmittedValue: (value){

                      },
                      onValidator: (value){

                      })


                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child:  Text('Cancel', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.alertColor),)),
              TextButton(
                  onPressed: (){

                    ref.child(SessionController().userId.toString()).update({
                      'userName' : nameController.text.toString()
                    }).then((value){
                      nameController.clear();
                    });
                    Navigator.pop(context);

                  },
                  child:  Text('Save',style: Theme.of(context).textTheme.titleSmall))
            ],
          );

        }
    );
  }

  Future<void> showPhoneNumberDialog(BuildContext context, String phoneNumber){

    phoneController.text = phoneNumber;
    return showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: const Center(child: Text('Update Phone Number')),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InputTextField(
                      myController: phoneController,
                      focusNode: phoneFocusNode,
                      keyBoardType: TextInputType.phone,
                      obscureText: false,
                      hint: 'Enter PhoneNumber',
                      onFieldSubmittedValue: (value){

                      },
                      onValidator: (value){

                      })


                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child:  Text('Cancel', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.alertColor),)),
              TextButton(
                  onPressed: (){

                    ref.child(SessionController().userId.toString()).update({
                      'phone' : phoneController.text.toString()
                    }).then((value){
                      phoneController.clear();
                    });
                    Navigator.pop(context);

                  },
                  child:  Text('Save',style: Theme.of(context).textTheme.titleSmall))
            ],
          );

        }
    );
  }


  void logOut (context)async{
    setLoading(true);

    try{
      auth.signOut().then((value){
        setLoading(false);
        Utils.toastMessage('Successfully LogOut');
        PersistentNavBarNavigator.pushNewScreen(context, screen: const LoginScreen(),
        withNavBar: false
        );

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