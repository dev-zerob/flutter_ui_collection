import 'package:flutter/material.dart';
import 'package:flutter_ui_collection/nike_shoes_store_app/features/product/screens/nike_shoes_store_home_screen.dart';
import 'package:flutter_ui_collection/ui_kit_app/main_ui_kit_app.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  void goProject(BuildContext context, Widget project) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => project,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ui Collection Project'),),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => goProject(context, UiKitAppHome()),
                child: Text('Ui Kit App'),
              ),
              ElevatedButton(
                onPressed: () => goProject(context, NikeShoesStoreHomeScreen()),
                child: Text('Nike Shoes Store App'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
