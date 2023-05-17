import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/components/input_text_field.dart';
import '../../resources/components/round_button.dart';
import '../../view_model/forgot_password/forgot_password.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height : height * .01,),
                Text('Forgot Password', style: Theme.of(context).textTheme.headline3,),
                SizedBox(height : height * .01,),
                Text('Enter your email address \n to recover your password',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,),
                SizedBox(height : height * .01,),
                Form(
                    key:_formKey,
                    child: Padding(
                      padding: EdgeInsets.only(top: height * .06, bottom: height * 0.01 ),
                      child: Column(
                        children: [
                          InputTextField(
                              myController: emailController,
                              focusNode: emailFocusNode,
                              keyBoardType: TextInputType.emailAddress,
                              obscureText: false,
                              hint: 'Email',
                              onFieldSubmittedValue: (value){

                              },
                              onValidator: (value){
                                return value.isEmpty ? 'enter email' : null ;
                              }
                          ),
                          SizedBox(height : height * 0.01,),
                        ],
                      ),
                    )
                ),
                const SizedBox(height: 40,),
                ChangeNotifierProvider(
                  create: (_) => ForgotController(),
                  child: Consumer<ForgotController>(
                    builder: (context, provider, child){
                      return RoundButton(
                        title: 'Recover',
                        loading: provider.loading,
                        onPress: (){
                          if(_formKey.currentState!.validate()){
                            provider.forgotPassword(context, emailController.text,);
                          }
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: height * .03,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}