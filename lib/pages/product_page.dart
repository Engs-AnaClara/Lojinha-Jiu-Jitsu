import 'package:ecomerce/models/product.dart';
import 'package:ecomerce/pages/cart_page.dart';
import 'package:ecomerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  final List<Product> clothes = [
    Product(name: 'Kimono Adulto', price: 450, icon: Icons.directions_walk),
    Product(name: 'Moletom',       price: 150, icon: Icons.dry_cleaning),
    Product(name: 'Camiseta',      price: 45,  icon: Icons.checkroom),
    Product(name: 'Faixa',         price: 50,  icon: Icons.horizontal_rule),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 221, 221),
      appBar: AppBar(
        title: Text('Produtos'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartPage()),
              );
            },
          )
        ],
      ),

      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          final product = clothes[index];

          return Container(
            margin: EdgeInsets.only(bottom: 12),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                // ícone + nome e preço
                Row(
                  children: [
                    Icon(product.icon, color: Colors.white, size: 32),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'R\$ ${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // botão
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.grey[700],
                  ),
                  child: Text('Adicionar'),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .add(product);
                  },
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}