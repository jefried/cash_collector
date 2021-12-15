import 'package:badges/badges.dart';
import 'package:cash_collector/components/switch_activity_state.dart';
import 'package:cash_collector/components/time_counter.dart';
import 'package:cash_collector/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AppBarContentWithBack extends StatefulWidget {
  final String title;
  const AppBarContentWithBack({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  AppBarContentWithBackState createState() => AppBarContentWithBackState();
}

class AppBarContentWithBackState extends State<AppBarContentWithBack> {


  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: secondaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.white,
      // centerTitle: true,
      title: Row(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
                fontFamily: 'Poppins Regular',
                fontSize: 18,
                color: secondaryColor
            ),
          ),
        ],
      ),
      actions: [
        const SwitchActivityState(),
        Badge(
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: infosColor1,
                size: 30,
              )
          ),
          position: BadgePosition(
              top: 4,
              end: 8
          ),
          badgeContent: Text(
            '1',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10
            ),
          ),
        ),
      ],
    );
  }
}
