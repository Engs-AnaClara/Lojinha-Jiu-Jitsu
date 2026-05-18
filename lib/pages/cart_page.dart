import 'package:ecomerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            // tabela cinza com todos os itens
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.builder(
                shrinkWrap: true, // importante pra caber dentro do Container
                physics: NeverScrollableScrollPhysics(),
                itemCount: cart.clothes.length,
                itemBuilder: (context, index) {
                  final product = cart.clothes[index];

                  return ListTile(
                    title: Text(
                      product.name,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'R\$ ${product.price.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white70),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.white),
                      onPressed: () => cart.remove(product),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 24),

            // total e botão
            Text(
              'Total: R\$ ${cart.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {},
              child: Text('Finalizar Compra'),
            ),

          ],
        ),
      ),
    );
  }
}