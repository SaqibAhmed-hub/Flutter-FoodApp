import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.verified_user),
          iconSize: 30.0,
          onPressed: () {},
        ),
        title: Text(
          "Food Delivery App",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Cart (${currentUser.cart.length})",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              //Snackbar in flutter
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Your Cart Item "),
              ));
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: 0.8)),
                  hintText: "Search Food or Restraurants",
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {},
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
