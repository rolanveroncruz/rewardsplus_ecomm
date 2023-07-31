import 'package:flutter/material.dart';
import 'package:rewardsplus_ecomm/pages/home/ui/main_page_widget.dart';

import '../pages/identity/identity_view.dart';

// ignore: must_be_mutable
class MyMainBottomNav extends StatefulWidget {
  int currentTabIndex = 0;
  MyMainBottomNav({super.key, currentTabIndex});

  @override
  State<MyMainBottomNav> createState() => _MyMainBottomNavState();
}

class _MyMainBottomNavState extends State<MyMainBottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentTabIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      onTap: navigate,
    ) ;
  }

  void navigate(int tabIndex){
    setState(() {
      widget.currentTabIndex = tabIndex;
    });
    switch(widget.currentTabIndex){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>const MainPageWidget()));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>IdentityPage()));
        break;
      default:
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>IdentityPage()));
        break;

    }
  }
}
