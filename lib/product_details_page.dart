import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/globalvariables.dart';
import 'package:shop_app/product_details_page.dart';
import 'package:shop_app/shopping_cards.dart';

class ProductDetailsPage extends StatefulWidget {
  final String name;
  final String image;
  final String price;
  final List<int> sizes;
  const ProductDetailsPage(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.sizes});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState(
      name: name, image: image, price: price, sizes: sizes);
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late String string;
  final String name;
  final String image;
  final String price;
  final List<int> sizes;
  _ProductDetailsPageState(
      {required this.name,
      required this.image,
      required this.price,
      required this.sizes});
  @override
  void initState() {
    super.initState();
    string = sizes[0].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(widget.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              )),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              widget.image,
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, border: Border.all(color: Colors.white)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\$${widget.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.sizes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  string = sizes[index].toString();
                                });
                              },
                              child: Chip(
                                label: Text(
                                  sizes[index].toString(),
                                ),
                                backgroundColor:
                                    sizes[index].toString() == string
                                        ? Colors.yellow
                                        : Colors.white,
                              )),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      iconAlignment: IconAlignment.start,
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.yellow),
                      ),
                      label: Text("Add to Cart"),
                      icon: Icon(Icons.shopping_bag),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
