import 'package:calculator/components/drawer_screen.dart';
import 'package:calculator/components/list_screen.dart';
import 'package:flutter/material.dart';

class NavigationBarScreenState extends StatefulWidget {
  const NavigationBarScreenState({super.key});

  @override
  State<NavigationBarScreenState> createState() => _NavigationBarScreenStateState();
}

class _NavigationBarScreenStateState extends State<NavigationBarScreenState> {
  int currentIndex = 0;
  PageController _pageController =PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
       body:PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
             setState(() {
            currentIndex = value;
            });
          },
        children: [
          ListScreen(),
          DrawerScreen(),
        ],
       ),
       bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        currentIndex: currentIndex,
        onTap: (value) {
          
          // _pageController.animateToPage(
          //  value ,
          //    duration: Duration(milliseconds: 300), 
          //    curve: Curves.linear);

          _pageController.jumpToPage(value);
        },
       items:[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          ),
           BottomNavigationBarItem(
          icon: Icon(Icons.search),
           label: "Search",
          ),
       ]
       ),
     
    );
  }
}