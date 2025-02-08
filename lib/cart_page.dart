import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';
// import 'package:shop_app/globalvariables.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<CartProvider>(context).cart);
    final cart = Provider.of<CartProvider>(context).cart;
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
                  cartItem['image'].toString(),
                ),
                radius: 30,
              ),
              trailing: GestureDetector(
                onTap: () {
                  print(Provider.of<CartProvider>(context, listen: false)
                      .cart[index]);
                  Provider.of<CartProvider>(context, listen: false)
                      .removeProduct(cart[index]);
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              title: Text(cartItem['name'] as String),
              subtitle: Text(cartItem['size'].toString()),
            );
          }),
    );
  }
}
