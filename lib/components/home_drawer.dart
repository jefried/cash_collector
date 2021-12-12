import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleHeight = screenHeight / 926;
    double scaleWidth = screenWidth / 428;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              Positioned(
                top: -59,
                left: -132,
                right: 0,
                child: Container(
                  height: 240,
                  width: 463 * scaleWidth,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/drawer_background.png'
                      ),
                      fit: BoxFit.fill
                    )
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                child: ListTile(
                  horizontalTitleGap: 5,
                  leading: Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 24,
                      color: Color(0xFFC24644),
                    ),
                  ),
                  title: SizedBox(
                    width: 180 * scaleWidth,
                    child: Text(
                      'Nyatchou Jonathan',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Poppins Medium',
                          fontSize: 16,
                          color: Colors.white
                      ),
                    ),
                  ),
                  subtitle: SizedBox(
                    width: 150 * scaleWidth,
                    child: Text(
                      '+237 652 692 742',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Poppins Regular',
                          fontSize: 12,
                          color: Colors.white
                      ),
                    ),
                  ),
                )
              ),
            ]
          )
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          horizontalTitleGap: 5,
          minLeadingWidth: 30,
          leading: const Icon(
            Icons.home,
            color: Color(0xFF707070),
            size: 22,
          ),
          title: Text(
            'Accueil',
            style: TextStyle(
              fontFamily: 'Poppins SemiBold',
              fontSize: 14.5,
              color: Color(0xFF242424)
            ),
          ),
          onTap: () {}
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          horizontalTitleGap: 5,
          minLeadingWidth: 30,
          leading: const Icon(
            CupertinoIcons.chat_bubble,
            color: Color(0xFF707070),
            size: 22,
          ),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Badge(
              position: const BadgePosition(end: -16, bottom: 4),
              badgeContent: Text(
                '2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10
                ),
              ),
              child: Text(
                'Chat',
                style: TextStyle(
                    fontFamily: 'Poppins SemiBold',
                    fontSize: 14.5,
                    color: Color(0xFF242424)
                ),
              ),
            ),
          ),
          onTap: () {}
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          horizontalTitleGap: 5,
          minLeadingWidth: 30,
          leading: Icon(
            Icons.person_add_alt_1_rounded,
            color: Color(0xFF707070),
            size: 22,
          ),
          title: Text(
            'Clients',
            style: TextStyle(
                fontFamily: 'Poppins SemiBold',
                fontSize: 14.5,
                color: Color(0xFF242424)
            ),
          ),
          onTap: () {}
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          horizontalTitleGap: 5,
          minLeadingWidth: 30,
          leading: const Icon(
            Icons.notifications,
            color: Color(0xFF707070),
            size: 22,
          ),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Badge(
              position: const BadgePosition(end: -16, bottom: 4),
              badgeContent: Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10
                ),
              ),
              child: Text(
                'Notifications',
                style: TextStyle(
                    fontFamily: 'Poppins SemiBold',
                    fontSize: 14.5,
                    color: Color(0xFF242424)
                ),
              ),
            ),
          ),
          onTap: () {}
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          horizontalTitleGap: 5,
          minLeadingWidth: 30,
          leading: const Icon(
            Icons.dashboard,
            color: Color(0xFF707070),
            size: 22,
          ),
          title: Text(
            'Dashboard',
            style: TextStyle(
                fontFamily: 'Poppins SemiBold',
                fontSize: 14.5,
                color: Color(0xFF242424)
            ),
          ),
          onTap: () {}
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          horizontalTitleGap: 5,
          minLeadingWidth: 30,
          leading: const Icon(
            Icons.person_sharp,
            color: Color(0xFF707070),
            size: 22,
          ),
          title: Text(
            'Mon compte',
            style: TextStyle(
                fontFamily: 'Poppins SemiBold',
                fontSize: 14.5,
                color: Color(0xFF242424)
            ),
          ),
          onTap: () {}
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          horizontalTitleGap: 5,
          minLeadingWidth: 30,
          leading: const Icon(
            Icons.logout_rounded,
            color: Color(0xFF707070),
            size: 22,
          ),
          title: Text(
            'Déconnexion',
            style: TextStyle(
                fontFamily: 'Poppins SemiBold',
                fontSize: 14.5,
                color: Color(0xFF242424)
            ),
          ),
          onTap: () {}
        ),
      ],
    );
  }
}
