import 'package:ecommerce_app/pages/cart.dart';
import 'package:ecommerce_app/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => const Home(),
    '/cart': (context) => const Cart(),
  }));
}