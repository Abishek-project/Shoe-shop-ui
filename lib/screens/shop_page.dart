import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop_ui/models/cart.dart';

import '../models/shoe.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  Cart cart = Cart();

  void addToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addShoesToCart(shoe);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: const Text("Successfully added!"),
        content: const Text("Check Yout Cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          searchWidget(),
          textDescription(),
          hotPicks(),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cart.shoesCollection.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 25),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 280,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          shoeImageWidget(index),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: shoeDescription(index),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            shoeDetailWidget(index),
                            addToCartButton(cart.shoesCollection[index]),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Divider(
              color: Colors.transparent,
            ),
          )
        ],
      ),
    );
  }

  shoeImageWidget(int index) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Image.asset(cart.shoesCollection[index].imagePath),
        ),
      ),
    );
  }

  Text shoeDescription(int index) {
    return Text(
      cart.shoesCollection[index].description,
      textAlign: TextAlign.justify,
      style: TextStyle(color: Colors.grey[600]),
    );
  }

  Column shoeDetailWidget(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cart.shoesCollection[index].shoeName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '\$${cart.shoesCollection[index].price}',
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  addToCartButton(shoe) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), bottomRight: Radius.circular(12))),
      child: IconButton(
        onPressed: () {
          addToCart(shoe);
        },
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  hotPicks() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text(
            "Hot picks 🔥",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Text(
            "See all",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          )
        ],
      ),
    );
  }

  Padding textDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        "everyone flies.. some fly longer than others",
        style: TextStyle(color: Colors.grey[500]),
      ),
    );
  }

  searchWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Search",
              style: TextStyle(color: Colors.grey),
            ),
            Icon(
              Icons.search,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
