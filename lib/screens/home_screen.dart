import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/RatingStar.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_orders.dart';
import 'RestaruntScreen.dart';

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
          icon: Icon(Icons.account_circle),
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
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: 0.8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          width: 0.8, color: Theme.of(context).primaryColor)),
                  hintText: "Search Food or Restaurants",
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {},
                  )),
            ),
          ),
          RecentOrders(), // Recent Order
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "NearBy Restarunts",
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0),
                  ),
                ),
                _buildRestarunts() //This will return the list of column Widgets
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildRestarunts() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RestaruntScreen(restarunt: restaurant))),
            child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.grey)),
        child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  height: 150.0,
                  width: 150.0,
                  image: AssetImage(
                    restaurant.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      restaurant.name,
                      style:
                          TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4.0),
                    RatingStar(restaurant.rating),
                    SizedBox(height: 6.0,),
                    Text(
                      restaurant.address,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.0),
                    Text("0.2 miles aways")
                  ],
                ),
              )
            ],
        ),
      ),
          )
      );
    });
    return Column(children: restaurantList);
  }
}
