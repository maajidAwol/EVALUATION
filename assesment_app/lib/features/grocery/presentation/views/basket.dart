import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Basket extends StatelessWidget {
  const Basket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0), 
                    child: BasketList(), 
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            PriceList(title: "Subtotal", price: "100"),
            PriceList(title: "Delivery Fee", price: "100"),
            PriceList(title: "Discount", price: "-100"),
            Divider(),
            PriceList(title: "Total", price: "100"),
            PlaceOrder(),


          ],
        ),
      ),
    );
  }
}

class PriceList extends StatelessWidget {
  final String title;
  final String price;

  PriceList({
    required this.title,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(title),
          Spacer(),
          Text(price),
        ],
      ),
    );
  }
}
