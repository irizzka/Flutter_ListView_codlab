import 'package:codlab3_liashuk/grid_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grid view',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GridViewPage(),
    );
  }
}


