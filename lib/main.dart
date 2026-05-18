import 'package:ecomerce/pages/product_page.dart';
import 'package:ecomerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(), 
      child: MyApp(), // app principal
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lojinha Jiu Jitsu',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductPage(), 
    );
  }
}