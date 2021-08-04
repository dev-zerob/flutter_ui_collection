import 'package:flutter/material.dart';
import 'package:flutter_ui_collection/nike_shoes_store_app/features/product/screens/nike_shoes_store_home_screen.dart';

class MainNikeShoesStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: NikeShoesStoreAppHome(),
    );
  }
}

class NikeShoesStoreAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nike Shoes Store App'),),
      body: NikeShoesStoreHomeScreen(),
    );
  }
}
