import 'package:calculator/components/drawer_screen.dart';
import 'package:calculator/components/list_screen.dart';
import 'package:flutter/material.dart';

class TabBarScreenExample  extends StatefulWidget {
  const TabBarScreenExample ({super.key});

  @override
  State<TabBarScreenExample> createState() => _TabBarScreenExampleState();
}

class _TabBarScreenExampleState extends State<TabBarScreenExample> 
  with SingleTickerProviderStateMixin{
    late TabController _tabController;

    @override
    void initState(){
      _tabController =TabController(length: 2, vsync: this);
      super.initState();
    }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab bar screen"),
        actions:[
          IconButton(
            onPressed: ( ){
              if(_tabController.index ==0){
                _tabController.animateTo(1);
              }else{
                _tabController.animateTo(0);
              }
           },
             icon:Icon(Icons.switch_access_shortcut),
             )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
            text:"Non Featured",
        ),
          Tab(
            text:"Featured",
        ),
          ]),
      ),
      body: TabBarView(
        controller:_tabController,
         children:[
          ListScreen(),
          DrawerScreen(),
         ],
         ),
      );
  }
}