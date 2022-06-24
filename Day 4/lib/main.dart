/**
 * Day 4 (23 Jun 2022)
 * Run code on  https://flutlab.io
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Internship Day 4',
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Flutter"),
      ),
      body: const Center(
        child: Text("Hello World !"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.local_taxi),
        onPressed: () {
          //WRITE HERE DRIVER CODE FOR TAXI BUTTON
        },
      ),
    ),
  ));
}
