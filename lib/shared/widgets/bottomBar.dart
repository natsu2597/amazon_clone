import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/accounts/screens/accounts_screen.dart';
import 'package:amazon_clone/features/cart/screens/cart_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CashScreen(),
  ]; 

  void updatePage(int page)
  {
    setState(() {
      _page = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariable.selectedNavBarColor,
        unselectedItemColor: GlobalVariable.unselectedNavBarColor,
        backgroundColor: GlobalVariable.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
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
              badgeContent:  Text(userCartLen.toString()),
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