import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';
import 'package:shop_app/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
          home: HomePage(),
          // home: ProductDetailsPage(
          //   name: 'Nike Shoe',
          //   image: 'assets/images/shoes_1.png',
          //   price: '44.2',
          //   sizes: [5, 6, 7, 8],
          // ),
          theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(),
          )),
    );
  }
}
