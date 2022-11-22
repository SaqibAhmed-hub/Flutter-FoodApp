import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';

class RestaruntScreen extends StatefulWidget {
  Restaurant restarunt;

  RestaruntScreen({required this.restarunt});

  @override
  State<RestaruntScreen> createState() => _RestaruntScreenState();
}

class _RestaruntScreenState extends State<RestaruntScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Restraunt Screen")),
      body: Container(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
