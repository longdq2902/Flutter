import 'package:flutter/material.dart';
import 'tab1.dart';
import 'tab2.dart';
import 'tab3.dart';
import 'tab4.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final tabController = new DefaultTabController(
      length: 4,
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(tabs: [
            new Tab(icon: new Icon(Icons.home, color: Colors.white,),text: "Home",),
            new Tab(icon: new Icon(Icons.group, color: Colors.white,),text: "Group",),
            new Tab(icon: new Icon(Icons.chat_bubble, color: Colors.white,),text: "Chat",),
            new Tab(icon: new Icon(Icons.cloud, color: Colors.white,),text: "Cloud",),
          ]),
        ),
        body: new TabBarView(
            children: [
              new Tab1(),
              new Tab2(),
              new Tab3(),
              new Tab4()
            ]
        ),
      ),
    );
    return new MaterialApp(
      title: "Tab Example",
      home: tabController,
    );
}




}



