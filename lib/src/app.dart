import 'package:flutter/material.dart';
import 'ui/media_group_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: SafeArea(child: MediaGroupList()),
      ),
    );
  }
}
