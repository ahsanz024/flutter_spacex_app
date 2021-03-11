import 'package:flutter/material.dart';
import 'package:flutter_spacex_app/widgets/main_drawer.dart';

abstract class BaseScreen extends StatelessWidget {
  String appBarTitle();
  Widget body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          appBarTitle(),
        ),
      ),
      body: body(),
    );
  }
}
