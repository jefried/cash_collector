import 'dart:ui';

import 'package:cash_collector/composants/block_button.dart';
import 'package:cash_collector/pages/creation_client.dart';
import 'package:cash_collector/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class MonCompte extends StatefulWidget {
  MonCompteState createState() => MonCompteState();
}

class MonCompteState extends State<MonCompte> {
  bool workStatus = true;

  @override
  Widget build(BuildContext context) {
    double appBarSize = 85;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: appBarSize,
            child: Stack(
              children: [
                Positioned(
                    top: 30,
                    child: Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: Text("Mon Compte", style: TextStyle(color: primaryColorAccent, fontSize: 20),),),
                    )
                ),
                Positioned(
                    top: 35,
                    left: 24,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios, color: primaryColorAccent),
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
          ),
          Container(
            height: MediaQuery.of(context).size.height - appBarSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 205,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          //borderRadius: BorderRadius.only(topRight: Radius.circular(29), topLeft: Radius.circular(29)),
                          image: DecorationImage(
                              image: AssetImage("assets/mon_compte/profil.jpg"),
                              fit: BoxFit.cover
                          )
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 10,
                            left: 20,
                            child: InkWell(
                              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CreationClient()));},
                              child: const BlockButton(text: "Mes transactions", linear: true, foregroundColor: Colors.white,),
                            )
                          ),
                          Positioned(
                              bottom: 20,
                              right: 20,
                              child: Container(
                                color: Colors.black.withOpacity(0.6),
                                child: const Text("PRO CENTER RC", style: TextStyle(color: Colors.white, fontSize: 17),),

                              )
                          )
                        ],
                      )
                  ),
                  const SizedBox(height: 20,),
                  const Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text("Profil", style: TextStyle(color: textColorGrey, fontSize: 16),),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFBEBEBE),
                            blurRadius: 6,
                            offset: Offset(0,3),
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        _listTileProfil("Noms", "Doe"),
                        const Divider(),
                        _listTileProfil("Prénoms", "John"),
                        const Divider(),
                        _listTileProfil("Sexe", "Masculin"),
                        const Divider(),
                        _listTileProfil("CNI", "000 000 000 000"),
                        const Divider(),
                        _listTileProfil("Numéro de téléphone", "+237 650 000 000"),
                        const Divider(),
                        const ListTile(
                          title: Text("Langue", style: TextStyle(color: textColorGreyAccent, fontSize: 14),),
                          subtitle: Text("Français", style: TextStyle(color: Colors.black, fontSize: 16),),
                          trailing: Icon(Icons.create_sharp, color: primaryColorAccent, size: 20,),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text("Sécurité", style: TextStyle(color: textColorGrey, fontSize: 16),),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFBEBEBE),
                            blurRadius: 6,
                            offset: Offset(0,3),
                          )
                        ]
                    ),
                    child: _listTileProfil("Mot de passe", "123456"),
                  ),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _listTileProfil(String title, String subtitle) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: textColorGreyAccent, fontSize: 14),),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.black, fontSize: 16),),
      trailing: const Icon(Icons.lock, color: textColorGrey, size: 20,),
    );
  }

}