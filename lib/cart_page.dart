import 'package:flutter/material.dart';
import 'package:shop_app/globalvariables.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  cartItem['imageUrl'] as String,
                ),
                radius: 30,
              ),
              trailing: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              title: Text(cartItem['title'] as String),
              subtitle: Text(cartItem['size'].toString()),
            );
          }),
    );
  }
}
