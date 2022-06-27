/**
*	Day 7
* 	27 Jun 2022
*	BottomNavigationBar and Drawer
*/

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.amber),
    home: Scaffold(
      //AppBar
      appBar: AppBar(),
      //Drawer
      drawer: Drawer(
        child: Column(
          children: const [
            UserAccountsDrawerHeader(accountName: Text('Haresh '), accountEmail: Text('haresh@yahoo.com')),
            ListTile(leading: Icon(Icons.fiber_dvr), title: Text('Fiber DVR')),
            ListTile(
              leading: Icon(Icons.golf_course),
              title: Text('Golf Course'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
      //Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'People'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmarks'),
        ],
      ),
      body: const Center(
        child: Text('This Is Body.'),
      ),
    ),
  ));
}

