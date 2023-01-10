import 'package:camera_gallery_permissions_app/loading_screen/loading_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Activity 5',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const LoadingScreen(),
  ));
}
