import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailor_app/view/dashboard/profile/profile_controller.dart';
import '../../../resources/color.dart';
import '../../../resources/components/round_button.dart';
import '../../../view_model/services/session_manager.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ref = FirebaseDatabase.instance.ref('User');
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider(
        create: (_) => ProfileController(),
        child: Consumer<ProfileController>(
          builder: (context, provider, child) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: StreamBuilder(
                  stream:
                      ref.child(SessionController().userId.toString()).onValue,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator(color: Colors.white,));
                    } else if (snapshot.hasData) {
                      Map<dynamic, dynamic> map = snapshot.data.snapshot.value;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Center(
                                  child: Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.primaryTextTextColor,
                                        )),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: provider.image == null
                                            ? map['profile'].toString() == ""
                                                ? const Icon(
                                                    Icons.person,
                                                    size: 35,
                                                  )
                                                : Image(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        map['profile']
                                                            .toString()),
                                                    loadingBuilder: (context,
                                                        child,
                                                        loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) return child;
                                                      return const Center(
                                                          child:
                                                              CircularProgressIndicator(color: Colors.white,));
                                                    },
                                                    errorBuilder: (context,
                                                        object, stack) {
                                                      return Container(
                                                        child: const Icon(
                                                          Icons.error_outline,
                                                          color: AppColors
                                                              .alertColor,
                                                        ),
                                                      );
                                                    },
                                                  )
                                            : Stack(
                                                children: [
                                                  Image.file(
                                                    File(provider.image!.path),
                                                  ),
                                                  const Center(
                                                    child:
                                                        CircularProgressIndicator(color: Colors.white,),
                                                  )
                                                ],
                                              )),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  provider.pickImage(context);
                                },
                                child: const CircleAvatar(
                                  radius: 14,
                                  backgroundColor: AppColors.primaryIconColor,
                                  child: Icon(
                                    Icons.add,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                              onTap: () {
                                provider.showUserNameDialog(
                                    context, map['userName']);
                              },
                              child: ReuseableRow(
                                  title: 'Username',
                                  value: map['userName'],
                                  iconData: Icons.person_outline)),
                          GestureDetector(
                              onTap: () {
                                provider.showPhoneNumberDialog(
                                    context, map['phone']);
                              },
                              child: ReuseableRow(
                                  title: 'Phone',
                                  value: map['phone'] == ' '
                                      ? 'xxx-xxx-xxx'
                                      : map['phone'],
                                  iconData: Icons.phone_outlined)),
                          ReuseableRow(
                              title: 'Email',
                              value: map['email'],
                              iconData: Icons.email_outlined),
                          const SizedBox(
                            height: 40,
                          ),
                          RoundButton(
                              title: 'Logout',

                              onPress: () {
                                provider.logOut(context);
                              })
                        ],
                      );
                    } else {
                      return Center(
                          child: Text(
                        'Something went wrong',
                        style: Theme.of(context).textTheme.titleMedium,
                      ));
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  final String title, value;
  final IconData iconData;
  const ReuseableRow(
      {required this.title,
      required this.value,
      required this.iconData,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          leading: Icon(
            iconData,
            color: AppColors.primaryIconColor,
          ),
          trailing: Text(
            value,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Divider(
          color: AppColors.dividedColor.withOpacity(0.4),
        )
      ],
    );
  }
}
