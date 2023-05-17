import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/components/input_text_field.dart';
import '../../resources/components/round_button.dart';
import '../../utils/routes/route_name.dart';
import '../../utils/routes/utils.dart';
import '../../view_model/signup/signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final emailFocusNode = FocusNode();
  final userNameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    emailController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height * 1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ChangeNotifierProvider(
              create: (_) => SignUpController(),
              child: Consumer<SignUpController>(
                builder: (context, provider, child ){
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: height * .01,),
                        Text('Welcome to App', style: Theme
                            .of(context)
                            .textTheme
                            .headline3,),
                        SizedBox(height: height * .01,),
                        Text('Enter your email address \n to register to your account',
                          textAlign: TextAlign.center,
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1,),
                        SizedBox(height: height * .01,),

                        Form(
                            key:_formKey,
                            child: Padding(
                              padding: EdgeInsets.only(top: height * .06, bottom: height * 0.01 ),
                              child: Column(
                                children: [
                                  InputTextField(
                                      myController: userNameController,
                                      focusNode: userNameFocusNode,
                                      keyBoardType: TextInputType.emailAddress,
                                      obscureText: false,
                                      hint: 'Username',
                                      onFieldSubmittedValue: (value){

                                      },
                                      onValidator: (value){
                                        return value.isEmpty ? 'enter username' : null ;
                                      }
                                  ),
                                  SizedBox(height : height * 0.01,),
                                  InputTextField(
                                      myController: emailController,
                                      focusNode: emailFocusNode,
                                      keyBoardType: TextInputType.emailAddress,
                                      obscureText: false,
                                      hint: 'Email',
                                      onFieldSubmittedValue: (value){
                                        Utils.focusField(context, emailFocusNode, passwordFocusNode);

                                      },
                                      onValidator: (value){
                                        return value.isEmpty ? 'enter email' : null ;
                                      }
                                  ),
                                  SizedBox(height : height * 0.01,),
                                  InputTextField(
                                      myController: passwordController,
                                      focusNode: passwordFocusNode,
                                      keyBoardType: TextInputType.emailAddress,
                                      obscureText: true,
                                      hint: 'Password',
                                      onFieldSubmittedValue: (value){

                                      },
                                      onValidator: (value){
                                        return value.isEmpty ? 'enter password' : null ;
                                      }
                                  ),
                                ],
                              ),
                            )
                        ),
                        const SizedBox(height: 40,),
                        RoundButton(title: 'Sign Up',
                          loading: provider.loading,
                          onPress: () {
                            if(_formKey.currentState!.validate()){
                              provider.signUp(context,
                                  userNameController.text.toString(),
                                  emailController.text.toString(),
                                  passwordController.text.toString()
                              );
                            }
                          },
                        ),
                        SizedBox(height: height * .03,),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, RouteName.loginScreen);
                          },
                          child: Text.rich(
                              TextSpan(
                                  text: "Already have an account ? ",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontSize: 15),
                                  children: [
                                    TextSpan(
                                      text: 'Login',
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(fontSize: 15,
                                          decoration: TextDecoration.underline),
                                    )
                                  ]
                              )
                          ),
                        )
                      ],
                    ),
                  );
                },

              ),
            )
        ),
      ),
    );
  }
}