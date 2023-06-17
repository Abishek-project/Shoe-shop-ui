import 'package:shoe_shop_ui/models/shoe.dart';

class Cart {
  List<Shoe> shoesCollection = [
    Shoe(
        shoeName: "Zoom Freak",
        price: 230,
        description:
            "Unleash your inner beast on the court with the Nike Zoom Freak, Giannis Antetokounmpo's signature basketball shoe featuring responsive Zoom Air cushioning and a supportive fit.",
        imagePath: "assets/ZoomFreak.png"),
    Shoe(
        shoeName: "Zoom Freak 2",
        price: 250,
        description:
            " Dominate the game with explosive power and agility in the Nike Zoom Freak 2, Giannis Antetokounmpo's second signature basketball shoe, designed with enhanced Zoom Air cushioning and a durable multi-directional traction pattern.",
        imagePath: "assets/freak2.png"),
    Shoe(
        shoeName: "Air Jordon",
        price: 240,
        description:
            "Experience the iconic style and legendary performance of the Air Jordan, the ultimate basketball shoe that combines heritage design with modern innovation.",
        imagePath: "assets/green.png"),
    Shoe(
        shoeName: "Air Max",
        price: 280,
        description:
            "Elevate your sneaker game with the Nike Air Max, featuring the classic visible Air unit for unparalleled cushioning and timeless style.",
        imagePath: "assets/red.png"),
  ];

  List userCart = [];

  List shoeList() {
    return shoesCollection;
  }

  List getUserCart() {
    return userCart;
  }

  addShoesToCart(Shoe shoe) {
    userCart.add(shoe);
  }

  removeShoesToCart(Shoe shoe) {
    userCart.remove(shoe);
  }
}
