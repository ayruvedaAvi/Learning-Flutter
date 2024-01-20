import 'package:flutter/material.dart';
import 'package:image_slider/body_container.dart';
void main(){
  runApp(
    MaterialApp(
      title: "Image slider",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Image slider"),
          backgroundColor: const Color.fromARGB(255, 30, 10, 80),
        ),
        body: const BodyContainer(),
        ),
      ),
    );
}