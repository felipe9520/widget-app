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

];




