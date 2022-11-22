import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Recent Orders",
            style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0),
          ),
        ),
        // This is the RecyclerView in flutter
        Container(
          height: 120.0,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 8.0),
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders.length,
              itemBuilder: (BuildContext context, int index) {
                Order orders = currentUser.orders[index];
                return _buildRecentOrders(context, orders);
              }),
        )
      ],
    );
  }

  _buildRecentOrders(BuildContext context, Order orders) {
    return Container(
      width: 320.0,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(width: 1.0, color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                    ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.cover,
                      image: AssetImage(orders.food.imageUrl),
                    ),
                  ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              orders.food.name,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              orders.restaurant.name,
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 4.0),
                            Text(orders.date, style: TextStyle(fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                    )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            width: 48.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
}
