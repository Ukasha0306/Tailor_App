import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tailor_app/resources/color.dart';
import 'package:tailor_app/resources/components/input_text_field.dart';

import '../../../utils/routes/utils.dart';
import '../../../view_model/services/session_manager.dart';

class MessageScreen extends StatefulWidget {

  final String image, name, email, receiverId;
  const MessageScreen({Key? key,
    required this.email,
    required this.image,
    required this.name,
    required this.receiverId

  }) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

  DatabaseReference ref = FirebaseDatabase.instance.ref().child('chat');
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toString()),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                  itemBuilder: (context, index){
                    return Text(index.toString());
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                      child:Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TextFormField(
                          controller: messageController,
                          cursorColor: AppColors.primaryTextTextColor,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 0, fontSize: 19),
                          decoration: InputDecoration(
                            hintText: 'Enter Message',
                            enabled: true,
                            contentPadding: const EdgeInsets.all(15),
                            suffixIcon: InkWell(
                              onTap: (){
                                sendMessage();

                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: CircleAvatar(
                                  backgroundColor: AppColors.primaryIconColor,
                                  child: Icon(Icons.send, color: Colors.white),
                                ),
                              ),
                            ),
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(height: 0 , color: AppColors.primaryTextTextColor.withOpacity(0.8)),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.textFieldDefaultFocus,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(50))),

                                focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.secondaryColor,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(50))
                            ),
                                errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.alertColor,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(50))
                            ),
                                enabledBorder:  const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.textFieldDefaultBorderColor
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(50))
                            ),
                          ),
                        ),
                      )
                  ),


                ],
              ),
            )

          ],
        ),
      ),
    );


  }
  sendMessage(){
    if(messageController.text.isEmpty){
      Utils.toastMessage('Enter the Message');

    }
    else{

      final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
      ref.child(timeStamp).set({
        'isSeen': false,
        'message': messageController.text.toString(),
        'sender': SessionController().userId.toString(),
        'receiver': widget.receiverId,
        'type': 'text',
        'time': timeStamp.toString()
      }).then((value){
        messageController.clear();
      });
    }
  }
}


