/**
 * Day 5
 * 24 Jun 2022
 * 
 * Steps to run project
 * 1) Go to https://flutlab.io
 * 2) Open Up Template(Boilerplate) Project
 * 3) Near Bottom go to 'Pub Commands'
 * 4) Then do 'pub add'  and write down    http   then hit enter (http only neither any quotes nor any symbol)
 * 5) Try to Run Below Code 
 */

//convert is used to convert json data to map object
import 'dart:convert';
import 'package:flutter/material.dart';
//http is for fetching data from api
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day 5',
      home: Scaffold(
          //App Bar with orange color
          appBar: AppBar(
            title: Text("INTERNSHIP"),
            backgroundColor: Colors.orange,
            actions: [
              MaterialButton(
                  child: Icon(Icons.people_alt),
                  onPressed: () {
                    print('User Icon Pressed');
                  }),
              MaterialButton(
                  child: Icon(Icons.shopping_cart),
                  onPressed: () {
                    print('Cart Icon Pressed');
                  })
            ],
          ),
          //Create FloatingActionButton
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.orange,
            ),
            onPressed: () {
              print('floating action button clicked');
            },
          ),

          //Create a Drawer Menu
          drawer: Drawer(
            backgroundColor: Colors.orange.shade100,
            child: Column(
              children: [
                Image.network(
                    'https://images.unsplash.com/photo-1655972670403-243839675e06?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0MXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
                Text('Name : Alice Taxes'),
                Text("Age : 50 years"),
                Text("Hobby : Cricket"),
                Text("Weight : 69 kg"),
                Text("Address : Los Angeles")
              ],
            ),
          ),
          //bottom Navigaton Bar
          bottomNavigationBar: NavigationBar(
            destinations: [
              GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.home), Text('Home')],
                ),
                onTap: () {
                  print("Home Clicked");
                },
              ),
              GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.local_taxi), Text('Taxi')],
                ),
                onTap: () {
                  print("Taxi Clicked");
                },
              ),
              GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.shop), Text('Shop')],
                ),
                onTap: () {
                  print("Shop Clicked");
                },
              ),
            ],
          ),
          //Body which contains BTC price
          body: Center(
            child: FutureBuilder<double>(
              future: getBTCUSDPrice(),
              builder: (context, snapshot) {
                //while data (btc price) has not come show progress bar
                if (!snapshot.hasData) return CircularProgressIndicator();

                double price = snapshot.data!;
                return Text("BTC : $price USD", style: TextStyle(fontSize: 22));
              },
            ),
          )),
    );
  }
}

//This Function fetch api data and returns  price of btc in usd
Future<double> getBTCUSDPrice() async {
  try {
    String url = 'https://api.coindesk.com/v1/bpi/currentprice.json';
    http.Response response = await http.get(Uri.parse(url));

    //this list variable will Contains key-values pairs (Map Object)
    //which is 4 pairs in our case (4 - Main Keys)
    final list = json.decode(response.body);
    print("Pairs Count: ${list.length}");

    //Now, We are interested in finding BTC price
    //and for that main key is 'bpi' so,lets pick that one

    double price = list['bpi']['USD']['rate_float'];
    print("price: $price");

    return price;
  } catch (e) {
    print(e.toString());
    return -1;
  }
}
