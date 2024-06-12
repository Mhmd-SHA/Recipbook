import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipbook/const.dart';

class BottomNavbar extends StatefulWidget {
  int currentIndex;
  Function ontap;
  BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.ontap,
  });

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 0,
      currentIndex: widget.currentIndex,
      iconSize: 20,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.blueGrey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        widget.ontap(value);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
              widget.currentIndex == 0 ? IconlyBold.home : IconlyBroken.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(widget.currentIndex == 1
              ? IconlyBold.bookmark
              : IconlyBroken.bookmark),
          label: "saved",
        ),
        BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                FontAwesomeIcons.add,
                color: Colors.white,
              ),
            ),
            label: "Add"),
        BottomNavigationBarItem(
          icon: Icon(widget.currentIndex == 3
              ? IconlyBold.notification
              : IconlyBroken.notification),
          label: "notification",
        ),
        BottomNavigationBarItem(
          icon: Icon(widget.currentIndex == 4
              ? IconlyBold.profile
              : IconlyBroken.profile),
          label: "profile",
        ),
      ],
    );

    BottomNavigationBar(
      currentIndex: widget.currentIndex,
      iconSize: 20,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.blueGrey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (value) {
        widget.ontap(value);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
              widget.currentIndex == 0 ? IconlyBold.home : IconlyBroken.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(widget.currentIndex == 1
              ? IconlyBold.bookmark
              : IconlyBroken.bookmark),
          label: "category",
        ),
        BottomNavigationBarItem(
          icon: Icon(widget.currentIndex == 2
              ? IconlyBold.notification
              : IconlyBroken.notification),
          label: "buy",
        ),
        BottomNavigationBarItem(
          icon: Icon(widget.currentIndex == 3
              ? IconlyBold.profile
              : IconlyBroken.profile),
          label: "profile",
        ),
      ],
    );
  }
}




// BottomNavigationBar(
//       currentIndex: widget.currentIndex,
//       iconSize: 20,
//       selectedItemColor: Colors.orange,
//       unselectedItemColor: Colors.blueGrey,
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//       onTap: (value) {
//         widget.ontap(value);
//       },
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(
//               widget.currentIndex == 0 ? IconlyBold.home : IconlyBroken.home),
//           label: "Home",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(widget.currentIndex == 1
//               ? IconlyBold.bookmark
//               : IconlyBroken.bookmark),
//           label: "category",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(widget.currentIndex == 2
//               ? IconlyBold.notification
//               : IconlyBroken.notification),
//           label: "buy",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(widget.currentIndex == 3
//               ? IconlyBold.profile
//               : IconlyBroken.profile),
//           label: "profile",
//         ),
//       ],
//     )