import 'package:flutter/material.dart';
import 'package:shop_app/globalvariables.dart';
import 'package:shop_app/shopping_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> filters =  ['all','nike','adidas','bata'];
    late String selectedFilter;
    @override
     
    void initState(){
      super.initState();
      selectedFilter= filters[0];
    }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Shoes \nCollection',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(40)),
                    ),
                  ),
                ),)
              ],
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(scrollDirection: Axis.horizontal, itemCount:filters.length, itemBuilder: (context, index){
                
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: (){
                      selectedFilter = filters[index];
                      setState(() {
                        
                      });
                      
                    },
                    child: Chip(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      label: Text(filters[index]),
                      backgroundColor: selectedFilter==filters[index]? Colors.yellow: Colors.white),
                  ),
                    
                );
              },),
            ),
            Expanded(
              child: ListView.builder(itemCount: products.length, itemBuilder: (context, index) {
                return ShoppingCards(name: products[index]['title'].toString(), price: products[index]['price'].toString(), image: products[index]['imageUrl'].toString(),
                color: index%2==0? Colors.white: Colors.grey,);
              },),
            ),

          ],

        ),
      ),
    );
  }
}
