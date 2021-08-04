import 'package:flutter/material.dart';

class MainUiKitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: UiKitAppHome()
    );
  }
}

class UiKitAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ui Kit App'),),
      body: Container(),
    );
  }
}
