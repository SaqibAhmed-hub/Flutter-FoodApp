import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  int _itemQuantity = 0;

  void _incrementItem(quantity){
    setState(() {
        quantity += 1;
        _itemQuantity = quantity;
    });
  }

  void _decrementItem(){
    setState(() {
      if(_itemQuantity != 0){
        _itemQuantity--;
      }
    });
  }

  _buildOrderItem(Order order) {
    return Container(
      height: 170.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(order.food.imageUrl),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15.0)),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      order.food.name,
                      style: TextStyle(
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      order.restaurant.name,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(width: 0.8),
                      ),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                               // setState(() {
                               //   _itemQuantity--;
                               // });
                                _decrementItem();
                              },
                              child: Text(
                                ' - ',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 22.0),
                              )),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('$_itemQuantity',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                              onTap: () {
                                _incrementItem(order.quantity);
                              },
                              child: Text(
                                ' + ',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 22.0),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Text(
            '\$${order.quantity * order.food.price}',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart (${currentUser.cart.length})'),
        ),
        // This is the RecyclerView in Flutter With Divider
        body: ListView.separated(
            itemBuilder: (context, index) {
              Order order = currentUser.cart[index];
              return _buildOrderItem(order);
            },
            separatorBuilder: (context, index) {
              return Divider(height: 2.0, color: Colors.grey);
            },
            itemCount: currentUser.cart.length));
  }
}
