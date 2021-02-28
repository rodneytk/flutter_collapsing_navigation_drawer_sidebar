import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: 'Painel', icon: Icons.insert_chart),
  NavigationModel(title: 'Pedidos', icon: Icons.shopping_bag),
  NavigationModel(title: 'Downloads', icon: Icons.download_sharp),
  NavigationModel(title: 'Endereços', icon: Icons.room),
  NavigationModel(title: 'Detalhes da conta', icon: Icons.account_box),
  NavigationModel(title: 'Sair', icon: Icons.exit_to_app),
];
