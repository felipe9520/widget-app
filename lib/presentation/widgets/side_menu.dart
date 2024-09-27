import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    //* Validar Notch
    final hasNocth = MediaQuery.of(context).viewPadding.top > 35;
    // tomando valor del padding 
    //if (Platform.isAndroid) {
    //  print( 'Android $hasNocth ' );
    //}else {
    //  print( 'ios $hasNocth ' ); 
    //}     

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
      },
      children: [
        
        Padding(
          padding: EdgeInsets.fromLTRB(20, hasNocth ? 0 : 20, 0, 0),
          child: const Text('Menu'),
        ),

        ...appMenuItems
        .sublist(0,3)
        .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon),
          label: Text(item.title),
          ),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10 , 28, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
          child: Text('More options'),
        ),

        ...appMenuItems
        .sublist(3)
        .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon),
          label: Text(item.title),
          ),
        ),              

      ], 
    );
  }
}