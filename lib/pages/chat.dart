import 'package:cash_collector/composants/circular_button.dart';
import 'package:cash_collector/composants/own_message_card.dart';
import 'package:cash_collector/composants/reply_message_card.dart';
import 'package:cash_collector/models/message.dart';
import 'package:cash_collector/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  ChatState createState() => ChatState();
}

class ChatState extends State<Chat> {
  bool workStatus = true;
  bool sendButton = false;
  TextEditingController messageController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  List<Message> messages = [
    Message(message: "Hello There! 😜", date: "12.05", me:false),
    Message(message: "Oh Hi", date: "12.05", me: true),
    Message(message: "Your package will arrive soon! just prepare", date: "12.05", me: false),
    Message(message: "Hello There! 😜", date: "12.05", me:false),
    Message(message: "Your package will arrive soon! just prepare", date: "12.05", me: true),
    Message(message: "Your package will arrive soon! just prepare", date: "12.05", me: false),
    Message(message: "Hello There! 😜", date: "12.05", me:false),
    Message(message: "Your package will arrive soon! just prepare", date: "12.05", me: true),
    Message(message: "Your package will arrive soon! just prepare", date: "12.05", me: false),
    Message(message: "Hello There! 😜", date: "12.05", me:false),
    Message(message: "Oh Hi", date: "12.05", me: true),
    Message(message: "Your package will arrive soon! just prepare", date: "12.05", me: false),
    Message(message: "Hello There! 😜", date: "12.05", me:false),
    Message(message: "Your package will arrive soon! just prepareYour package will arrive soon! just prepare", date: "12.05", me: true),
    Message(message: "Your package will arrive soon! just prepare", date: "12.05", me: false),
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double appBarSize = 85;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    color: const Color(0xFFF3F3FF),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(height: appBarSize,),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.builder(
                                shrinkWrap: true,
                                controller: _scrollController,
                                itemCount: messages.length +1,
                                itemBuilder: (context, index) {
                                  if(index == 0) {
                                    return Container();
                                  }
                                  if(messages[messages.length-index].me == true) {
                                    return OwnMessageCard(message: messages[messages.length-index].message, date: messages[messages.length-index].date);
                                  } else {
                                    return ReplyMessageCard(message: messages[messages.length-index].message, date: messages[messages.length-index].date);
                                  }
                                }
                            ),
                          ),
                        ),

                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      //const CircularButton(icon: Icons.emoji_emotions_outlined,size: 35, sizeIcon: 22,),
                                      //const SizedBox(width: 6,),
                                      Expanded(
                                        child: Card(
                                          margin: const EdgeInsets.only(left: 2, right: 2, bottom: 0),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 8, left: 10),
                                            child: TextFormField(
                                              controller: messageController,
                                              textAlignVertical: TextAlignVertical.center,
                                              keyboardType: TextInputType.multiline,
                                              maxLines: 5,
                                              minLines: 1,
                                              onChanged: (value){
                                                if(value.length>0){
                                                  setState(() {
                                                    sendButton = true;
                                                  });
                                                }
                                                else {
                                                  setState(() {
                                                    sendButton = false;
                                                  });
                                                }
                                              },
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Type a message",
                                                contentPadding: EdgeInsets.all(5),
                                              ),
                                            ),
                                          )
                                        ),
                                      ),
                                      const SizedBox(width: 6,),
                                      InkWell(
                                        onTap: (){
                                          if(messageController.text.isNotEmpty) {
                                            _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                                            setState(() {
                                              messages.insert(0,Message(message: messageController.text, date: "now", me: true));
                                              messageController.clear();
                                            });
                                          }
                                        },
                                        child: const CircularButton(icon: Icons.send,size: 35, sizeIcon: 22,),
                                      )
                                      //const SizedBox(width: 6,),
                                      //const CircularButton(icon: Icons.photo_camera,size: 35, sizeIcon: 22,),
                                    ],
                                  ),
                                ],
                              ),
                            )
                        )
                        /*Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            color: const Color(0xFFF3F3FF),
                            height: bottomBarSize,
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: const [
                                  CircularButton(icon: Icons.emoji_emotions_outlined,size: 35, sizeIcon: 22,),
                                  SizedBox(width: 6,),
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.red, width: 5.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.red, width: 5.0),
                                        ),
                                        hintText: 'Dites quelque chose ...',
                                      ),
                                      maxLines: 6,
                                    ),
                                  ),
                                  SizedBox(width: 6,),
                                  CircularButton(icon: Icons.send,size: 35, sizeIcon: 22,),
                                  SizedBox(width: 6,),
                                  CircularButton(icon: Icons.photo_camera,size: 35, sizeIcon: 22,),
                                ],
                              ),
                            ),
                          ),
                        )*/
                      ],
                    )
                ),
              ],
            ),
          ),
          _appBar(appBarSize)
        ],
      )
    );
  }

  Widget _appBar(double appBarSize) {
    return Container(
      height: appBarSize,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
              top: 30,
              child: SizedBox(
                height: 30,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/details_compte/profil.jpg",),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      Text("Chat", style: TextStyle(color: primaryColorAccent, fontSize: 20),),
                    ],
                  )
                ),
              )
          ),
          Positioned(
              top: 35,
              left: 24,
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios, color: primaryColorAccent),
              )
          ),
          Positioned(
              top: 30,
              right: 24,
              child: SizedBox(
                width: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FlutterSwitch(
                      showOnOff: true,
                      activeText: "on",
                      inactiveText: "off",
                      height: 20.0,
                      width: 45.0,
                      padding: 0.0,
                      toggleSize: 15.0,
                      borderRadius: 17.0,
                      activeColor: radioColor,
                      value: workStatus,
                      onToggle: (value) {
                        setState(() {
                          workStatus = value;
                        });
                      },
                    ),
                    const Text("07:50:23", style: TextStyle(fontSize: 12, color: Colors.red),)
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}