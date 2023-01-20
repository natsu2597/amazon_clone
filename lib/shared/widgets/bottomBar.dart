

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actula-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariable.selectedNavBarColor,
        unselectedItemColor: GlobalVariable.unselectedNavBarColor,
        backgroundColor: GlobalVariable.backgroundColor,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: _page == 0 ? GlobalVariable.selectedNavBarColor : GlobalVariable.backgroundColor,
                width: bottomBarBorderWidth
              ))
            ),
            child: const Icon(Icons.home_outlined),
          ),
          label: '',
          ),
          BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: _page == 1 ? GlobalVariable.selectedNavBarColor : GlobalVariable.backgroundColor,
                width: bottomBarBorderWidth
              ))
            ),
            child: const Icon(Icons.person_outlined),
          ),
          label: '',
          ),
          BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: _page == 2 ? GlobalVariable.selectedNavBarColor : GlobalVariable.backgroundColor,
                width: bottomBarBorderWidth
              ))
            ),
            child: Badge(
              elevation: 0,
              badgeContent: const Text('2'),
              badgeColor: Colors.white,
              child: const Icon(Icons.shopping_cart_outlined)),
          ),
          label: '',
          )
        ],
      )
    );
  }
}