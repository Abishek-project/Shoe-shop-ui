import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop_ui/models/cart.dart';
import 'package:shoe_shop_ui/models/shoe.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  removeShoesFromCart(shoe) {
    Provider.of<Cart>(context, listen: false).removeShoesFromCart(shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Cart",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const SizedBox(height: 15),
            Expanded(
                child: ListView.builder(
              itemCount: value.getUserCart().length,
              itemBuilder: (context, index) {
                Shoe shoe = value.getUserCart()[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: cartWidget(shoe),
                );
              },
            ))
          ],
        ),
      ),
    );
  }

  ListTile cartWidget(Shoe shoe) {
    return ListTile(
      leading: Image.asset(shoe.imagePath),
      title: Text(shoe.shoeName),
      subtitle: Text(shoe.price.toString()),
      trailing: IconButton(
          onPressed: () {
            removeShoesFromCart(shoe);
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.grey,
          )),
    );
  }
}
