import 'package:badges/badges.dart';
import 'package:cash_collector/components/app_bar_content.dart';
import 'package:cash_collector/components/client_present_card_home.dart';
import 'package:cash_collector/components/home_drawer.dart';
import 'package:cash_collector/helpers/colors.dart';
import 'package:cash_collector/helpers/map_displayer.dart';
import 'package:cash_collector/pages/home_clients_list.dart';
import 'package:flutter/material.dart';
import 'package:here_sdk/mapview.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
  MapDisplayer? mapDisplayer;
  int selectedClientId = 0;
  int pageIndex = 0;


  List<Map<String, dynamic>> clientsInfos = [
    {
      'id': 1,
      'name': 'Sondi Manga',
      'adress': 'Melen, Yaoundé',
      'latitude': 3.8754212,
      'longitude': 11.511222
    },
    {
      'id': 2,
      'name': 'Malina Jenevièvre',
      'adress': 'Oyomabang, Yaoundé',
      'latitude': 3.8712532,
      'longitude': 11.5184521
    },
    {
      'id': 3,
      'name': 'Lili goumette',
      'adress': 'Melen, Yaoundé',
      'latitude': 3.8798451,
      'longitude': 11.514121
    },
    {
      'id': 4,
      'name': 'Sondi Manga',
      'adress': 'Melen, Yaoundé',
      'latitude': 3.870125,
      'longitude': 11.508654
    },
    {
      'id': 5,
      'name': 'Malina Jenevièvre',
      'adress': 'Oyomabang, Yaoundé',
      'latitude': 3.877784,
      'longitude': 11.519412
    },
  ];


  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay, (MapError? error) {
      if (error == null) {
        mapDisplayer = MapDisplayer(hereMapController, clientsInfos);
      } else {
        print("Map scene not loaded. MapError: " + error.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        key: drawerKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(57),
          child: AppBarContent(
            title: 'Accueil',
            onPressBtnMenu: () {
              drawerKey.currentState?.openDrawer();
            },
          ),
        ),
      drawer: Drawer(
        elevation: 0,
        child: HomeDrawer()
      ),
      body: Stack(
          children: [
            HereMap(
              onMapCreated: _onMapCreated,
            ),
            Positioned(
              bottom: 230,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF000000).withOpacity(0.29),
                          offset: const Offset(0, 3),
                          blurRadius: 13
                      )
                    ]
                ),
                child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext ctx) => HomeClientsList())
                      );
                    },
                    child: Row(
                        children: [
                          Text(
                            'Voir Tout',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Poppins Medium',
                                color: secondaryColor
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: principalColor,
                            size: 24,
                          )
                        ]
                    )
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SizedBox(
                  height: 230,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: clientsInfos.map(
                      (clientInfo) => ClientPresentCardHome(
                      imageUrl: 'assets/images/asset1.jpg',
                      address: clientInfo['adress']!,
                      name: clientInfo['name']!,
                      isClicked: clientInfo['id'] == selectedClientId,
                      onPress: () {
                        mapDisplayer?.setClientAsSelected(clientInfo['id']);
                        setState(() {
                          selectedClientId = clientInfo['id'];
                        });
                      }
                    ),
                  ).toList()
                )
              )
            )
          ]
      )
    );
  }
}

