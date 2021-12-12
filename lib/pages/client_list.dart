import 'package:cash_collector/components/client_list_item.dart';
import 'package:cash_collector/helpers/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientList extends StatefulWidget {
  const ClientList({Key? key}) : super(key: key);

  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {

  List<Map<String, String>> clientsInfos = [
    {
      'name': 'Sondi Manga',
      'job': 'Livreur',
      'adress': 'Melen, Yaoundé',
      'phone': '+237 655 222 678'
    },
    {
      'name': 'Malina Jenevièvre',
      'job': 'Commerçante',
      'adress': 'Oyomabang, Yaoundé',
      'phone': '+237 655 789 678'
    },
    {
      'name': 'Lili goumette',
      'job': 'Livreur',
      'adress': 'Melen, Yaoundé',
      'phone': '+237 655 222 678'
    },
    {
      'name': 'Sondi Manga',
      'job': 'Livreur',
      'adress': 'Melen, Yaoundé',
      'phone': '+237 655 222 678'
    },
    {
      'name': 'Malina Jenevièvre',
      'job': 'Commerçante',
      'adress': 'Oyomabang, Yaoundé',
      'phone': '+237 655 789 678'
    },
  ];

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: principalColor,
            size: 30,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Clients',
          style: TextStyle(
              fontFamily: 'Poppins Regular',
              fontSize: 18,
              color: principalColor
          ),
        ),
        actions: [
          Container(
            height: 36,
            width: 36,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFBEBEBE),
                  offset: Offset(0, 6),
                  blurRadius: 16
                )
              ],
            ),
            child: const Icon(
              Icons.map,
              color: Color(0xFFBEBEBE),
              size: 24,
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF3F3FF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(29),
            topRight: Radius.circular(29)
          )
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(23),
                            borderSide: const BorderSide(
                              color: Color(0xFF707070),
                              width: 0.2
                            )
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFFE2E2FF),
                            size: 24,
                          ),
                          hintText: 'Rechercher un client',
                          hintStyle: const TextStyle(
                            fontFamily: 'Poppins Light',
                            fontSize: 15,
                            color: Color(0xFFE2E2FF)
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Poppins Light',
                          fontSize: 15,
                          color: Color(0xFF000000)
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: MaterialButton(
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                              color: const Color(0xFF707070),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Filtre',
                                style: TextStyle(
                                    fontFamily: 'Poppins Light',
                                    fontSize: 13,
                                    color: Colors.white
                                ),
                              ),
                              Icon(
                                Icons.filter_list_rounded,
                                color: Colors.white,
                                size: 20,
                              )
                            ],
                          ),
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                height: screenHeight - 150,
                child: ListView(
                  children: clientsInfos.map(
                    (clientInfos) => ClientsListItem(
                      name: clientInfos['name']!,
                      job: clientInfos['job']!,
                      phoneNumber: clientInfos['phone']!,
                      address: clientInfos['adress']!,
                      imagePath: 'assets/images/asset1.jpg'
                    )
                  ).toList()
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
