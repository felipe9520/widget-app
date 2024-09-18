import 'package:flutter/material.dart';
// Forma de exponer solo IconData del package de material
//import 'package:flutter/material.dart' show IconData;



class MenuItem {

  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subtitle, 
    required this.link, 
    required this.icon
  });  
}


const appMenuItems = <MenuItem>[

  MenuItem(
    title: 'Botones', 
    subtitle: 'Varios botones en Flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined
  ),

  MenuItem(
    title: 'Tarjetas', 
    subtitle: 'Contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card
  ),

  MenuItem(
    title: 'Progress Indicators', 
    subtitle: 'Generales y Controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded
  ),

  MenuItem(
    title: 'Snackbars y Diálogos', 
    subtitle: 'Indicadores en Pantalla', 
    link: '/snackbars', 
    icon: Icons.info_outline
  ),

  MenuItem(
    title: 'Animated Container', 
    subtitle: 'Stateful widget animated', 
    link: '/animated', 
    icon: Icons.check_box_outline_blank_rounded
  ),

  MenuItem(
    title: 'UI Controls + Tiles', 
    subtitle: 'Una serie de controles de Flutter', 
    link: '/ui-controls', 
    icon: Icons.car_rental_outlined
  ),

  MenuItem(
    title: 'Introduccion a la aplicacion', 
    subtitle: 'Pequeño tutorial introductorio', 
    link: '/tutorial', 
    icon: Icons.accessible_outlined
  ),

  MenuItem(
    title: 'InfiniteScroll and Pull', 
    subtitle: 'Infinite List and Pull to Refresh', 
    link: '/infinitescroll', 
    icon: Icons.list_alt_rounded
  ),

];




