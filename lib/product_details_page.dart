import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final String name;
  final String image;
  final String price;
  final List<int> sizes;

  const ProductDetailsPage({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.sizes,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late String selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.sizes.first.toString();
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Details'),
        centerTitle: true,
      ),
      body: isLandscape ? landscapeLayout() : portraitLayout(),
    );
  }

  Widget portraitLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          productTitle(),
          productImage(),
          priceSection(),
          sizeSelector(),
          addToCartButton(),
        ],
      ),
    );
  }

  Widget landscapeLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: productImage()),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              productTitle(),
              priceSection(),
              sizeSelector(),
              addToCartButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget productTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget productImage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Image.asset(widget.image,
          width: double.infinity, fit: BoxFit.contain),
    );
  }

  Widget priceSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '\$${widget.price}',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      ),
    );
  }

  Widget sizeSelector() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.sizes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () =>
                setState(() => selectedSize = widget.sizes[index].toString()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chip(
                label: Text(
                  widget.sizes[index].toString(),
                  style: TextStyle(fontSize: 18),
                ),
                backgroundColor: widget.sizes[index].toString() == selectedSize
                    ? Colors.yellow
                    : Colors.grey.shade300,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget addToCartButton() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            if (selectedSize != "0") {
              Map<String, dynamic> product = {
                'image': widget.image,
                'name': widget.name,
                'price': widget.price,
                'size': selectedSize
              };
              Provider.of<CartProvider>(context, listen: false).addProduct(
                product,
              );
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Added to cart')));
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Please select size")));
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          label: Text("Add to Cart", style: TextStyle(fontSize: 18)),
          icon: Icon(Icons.shopping_bag),
        ),
      ),
    );
  }
}
