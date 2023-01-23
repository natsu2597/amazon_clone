import 'package:amazon_clone/features/admin/screens/post_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const PostScreen(),
    const Center(child:  Text("Post Analytic")),
    const Center(child:  Text("Cart Page")),
  ]; 

  void updatePage(int page)
  {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: _buildBottomBar(),
      appBar: _buildAppBar()
    );
  }


  _buildBottomBar() => 
  BottomNavigationBar(
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
            child: const Icon(Icons.analytics_outlined),
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
            child: const Icon(Icons.all_inbox_outlined),
          ),
          label: '',
          ),
          
        ],
      );

  _buildAppBar() => 
     PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:const  BoxDecoration(
              gradient: GlobalVariable.appBarGradient
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/images/amazon_in.png',width: 120,height: 45,color: Colors.black,),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(left: 15),
                child:const  Text("Admin",style: TextStyle(
                  fontSize: 22,color: Colors.black, fontWeight: FontWeight.w500
                ),)
              )
            ],
          ),
        ),
        
      );
}