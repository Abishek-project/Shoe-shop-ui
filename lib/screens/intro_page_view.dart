import 'package:flutter/material.dart';
import 'package:shoe_shop_ui/screens/home_view.dart';

class IntroPageView extends StatelessWidget {
  const IntroPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// `logoWidget()` is a method that returns a `Padding` widget containing an `Image.asset`
          /// widget that displays the Nike logo image.
          logoWidget(),
          const SizedBox(
            height: 48,
          ),

          /// `descriptionText()` is a method that returns a `Padding` widget containing two `Text` widgets.
          /// The first `Text` widget displays the text "Just Do It" in bold with a font size of 20. The
          /// second `Text` widget displays a longer description of the Nike brand and its products in a
          /// smaller font size of 16 and a grey color. Both `Text` widgets are wrapped in a `Column` widget
          /// to display them vertically.
          descriptionText(),
          const SizedBox(
            height: 48,
          ),

          /// `bottomButton()` is a method that returns a `Padding` widget containing a `Container`
          /// widget with a black background color and rounded corners. Inside the `Container`, there is
          /// a `Center` widget containing a `Text` widget with the text "Shop" in white color and bold
          /// font. This method is used to display a button at the bottom of the screen.
          bottomButton(context)
        ],
      ),
    );
  }

  bottomButton(context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            )),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey[900], borderRadius: BorderRadius.circular(12)),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                "Shop",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  descriptionText() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: const [
          Text(
            "Just Do It",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Brand new sneakers and custom kicks made with premium quality",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Padding logoWidget() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Image.asset("assets/nike-logo.png"),
    );
  }
}
