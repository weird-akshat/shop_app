import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class ProductDetailsPage extends StatelessWidget {
  final String name;
  final String image;
  final String price;    
  final List<int> sizes;
  const ProductDetailsPage({super.key, required this.name, required this.image, required this.price, required this.sizes});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text('Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(name),
          Image.asset(image),
         
          Container(
            color: Colors.blue,
            child: Column(
              children: [
                Text('\$$price'),
                SizedBox(
                  height: 100,
                  child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: sizes.length, itemBuilder: (context,index){
                    
                    return Chip(label: Text(sizes[index].toString()));
                  }),
                ),
                 ElevatedButton(onPressed: (){}, child: Text("Add to Cart"))
              ],
              
            ),
          ),
          
         


        ],
      ),
      
    );
  }
}