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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(name, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(image, height: 400,),
            ),
           
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('\$$price', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: sizes.length, itemBuilder: (context,index){
                      
                      return Chip(label: Text(sizes[index].toString()));
                    }),
                  ),
                   ElevatedButton(onPressed: (){},style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size( 400, 40)),
                    backgroundColor: WidgetStatePropertyAll(Colors.yellow),
                   ), child: Text("Add to Cart"))
                ],
                
              ),
            ),
            
           
        
        
          ],
        ),
      ),
      
    );
  }
}