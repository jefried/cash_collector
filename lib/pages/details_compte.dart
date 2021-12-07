import 'dart:ui';

import 'package:cash_collector/composants/block_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailCompte extends StatefulWidget {
  DetailCompteState createState() => DetailCompteState();

}

class DetailCompteState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 268,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/details_compte/profil.jpg"),
                  fit: BoxFit.cover,
                )
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 26,
                    left: 24,
                    child: InkWell(
                      onTap: (){Navigator.pop(context);},
                      child: Icon(Icons.arrow_back_ios, color: Color(0xFF075BD5),),
                    )
                  ),
                  Positioned(
                    top: 26,
                    right: 24,
                    child: Icon(Icons.create_sharp, color: Color(0xFF075BD5),),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 24,
                    child: BlockButton(text: "Ondua Jacqueline", foregroundColor: Color(0xFF075BD5))
                  ),
                  Positioned(
                      bottom: 8,
                      left: 24,
                      child: Container(
                        height: 47,
                        width: 135,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: BlockButton(text: "Encaissement", backgroundColor: Color(0xFF060DD9), foregroundColor: Colors.white, linear: true,),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 11,
                                backgroundColor: Color(0xFF060DD9),
                                child: Center(
                                  child: Icon(Icons.add, color: Colors.white, size: 20,),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2.0,
                                      color: Colors.white
                                  ),
                                ),
                              )
                            )
                          ],
                        ),
                      )
                  )
                ],
              ),
            ),
            SizedBox(height: 22,),
            Row(
              children: [
                SizedBox(width: 32,),
                BlockButton(text: "Info", foregroundColor: Color(0xFF075BD5), colorShadow: Color(0xFF075BD5), shadow: true,),
                SizedBox(width: 16,),
                BlockButton(text: "Directions", foregroundColor: Color(0xFF707070), shadow: true,),
                SizedBox(width: 16,),
                BlockButton(text: "Appels", foregroundColor: Color(0xFF707070), shadow: true,),
              ],
            ),
            SizedBox(height: 24,),
            Container(
              height: 750,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFF3F3FF),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(29), topLeft: Radius.circular(29))
              ),
              child: DefaultTabController(
                  length: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 8,),
                      TabBar(
                        indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(width: 3.0, color: Color(0xFF075BD5)),
                            insets: EdgeInsets.symmetric(horizontal: 40.0)
                        ),
                        tabs: [
                          Tab(child: Text("Infos basiques", style: TextStyle(color: Color(0xFF707070)),),),
                          Tab(child: Text("Photos", style: TextStyle(color: Color(0xFF707070)),),),
                          Tab(child: Text("Historique", style: TextStyle(color: Color(0xFF707070)),),),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            _infosBasiques(),
                            _photos(),
                            _historique(),
                          ],
                        ),
                      ),

                    ],
                  )

              ),

            ),

          ],
        )
      )
    );
  }

  Widget _infosBasiques() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(9), topRight: Radius.circular(9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text("Activité - Commerçante", style: TextStyle(fontSize: 13, color: Color(0xFF707070)),),
          ),
          Divider(color: Color(0xFF707070), indent: 15, endIndent: 15,),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("Téléphone  -  +237 650 000000", style: TextStyle(fontSize: 13, color: Color(0xFF707070))),
          ),
          Divider(color: Color(0xFF707070), indent: 15, endIndent: 15,),
          ListTile(
            leading: Icon(CupertinoIcons.location),
            title: Text("Marché Melen  -  Yaoundé", style: TextStyle(fontSize: 13, color: Color(0xFF707070))),
          ),
          Divider(color: Color(0xFF707070), indent: 15, endIndent: 15,),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("CNI  -  100 020 001 000", style: TextStyle(fontSize: 13, color: Color(0xFF707070))),
          ),
          Divider(color: Color(0xFF707070), indent: 15, endIndent: 15,),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text("Personne à contacter", style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF707070),
            )),
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text("Donald Trump", style: TextStyle(fontSize: 13, color: Color(0xFF707070)),),
          ),
          Divider(color: Color(0xFF707070), indent: 15, endIndent: 15,),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("Téléphone  -  +237 650 000000", style: TextStyle(fontSize: 13, color: Color(0xFF707070))),
          ),
          Divider(color: Color(0xFF707070), indent: 15, endIndent: 15,),
          ListTile(
            leading: Icon(CupertinoIcons.location),
            title: Text("Marché Melen  -  Yaoundé", style: TextStyle(fontSize: 13, color: Color(0xFF707070))),
          ),
          Divider(color: Color(0xFF707070), indent: 15, endIndent: 15,),
        ],
      ),
    );
  }

  Widget _photos() {
    return Container(width: double.infinity, height: 50, color: Colors.yellow, margin: EdgeInsets.symmetric(horizontal: 24));
  }

  Widget _historique() {
    return Container(width: double.infinity, height: 50, color: Colors.green, margin: EdgeInsets.symmetric(horizontal: 24));
  }

}