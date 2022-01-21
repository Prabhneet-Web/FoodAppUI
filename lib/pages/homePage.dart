import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/animations/fadeAnimation.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: Icon(null),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_basket,
                color: Colors.grey[800],
              ))
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimation(
                    1,
                    Text("Food Delivery",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 30,
                            fontWeight: FontWeight.bold))),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      FadeAnimation(
                          1, makeCategory(isActive: true, title: 'Pizza')),
                      FadeAnimation(
                          1.2, makeCategory(isActive: false, title: 'Burgers')),
                      FadeAnimation(
                          1.3, makeCategory(isActive: false, title: 'Kebab')),
                      FadeAnimation(
                          1.4, makeCategory(isActive: false, title: 'Desert')),
                      FadeAnimation(
                          1.5, makeCategory(isActive: false, title: 'Salad')),
                      FadeAnimation(
                          1.6, makeCategory(isActive: false, title: 'Fruits')),
                      FadeAnimation(
                          1.7, makeCategory(isActive: false, title: 'Pasta')),
                      FadeAnimation(1.8,
                          makeCategory(isActive: false, title: 'French Fries')),
                      FadeAnimation(
                          1.9, makeCategory(isActive: false, title: 'Cutlet')),
                      FadeAnimation(
                          2.0, makeCategory(isActive: false, title: 'Rolls'))
                    ],
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
          FadeAnimation(
              1,
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Free Delivery",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FadeAnimation(
                      0.5,
                      makeItem(
                          image: 'lib/assets/images/one.jpeg',
                          title: "Aloo Tikki",
                          price: "₹ 15")),
                  FadeAnimation(
                      0.6,
                      makeItem(
                          image: 'lib/assets/images/two.jpeg',
                          title: "Salad",
                          price: "₹30")),
                  FadeAnimation(
                      0.7,
                      makeItem(
                          image: 'lib/assets/images/three.jpg',
                          title: "ChamCham",
                          price: "₹ 20")),
                  FadeAnimation(
                      0.8,
                      makeItem(
                          image: 'lib/assets/images/four.jpg',
                          title: "Chicken",
                          price: "₹250")),
                  FadeAnimation(
                      0.9,
                      makeItem(
                          image: 'lib/assets/images/five.jpg',
                          title: "NutShell",
                          price: "₹150"))
                ],
              ),
            ),
          ),
          const SizedBox(height: 30)
        ],
      )),
    );
  }

  Widget makeCategory({isActive, title}) {
    return AspectRatio(
        aspectRatio: isActive ? 3 : 2.0 / 1,
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              color: isActive ? Colors.yellow[700] : Colors.white,
              borderRadius: BorderRadius.circular(50)),
          child: Align(
            child: FittedBox(
              fit: BoxFit.fill,
              child: Text(
                title,
                style: TextStyle(
                    color: isActive ? Colors.white : Colors.grey[700],
                    fontSize: 18,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.w100),
              ),
            ),
          ),
        ));
  }

  Widget makeItem({image, title, price}) {
    return AspectRatio(
      aspectRatio: 1 / 1.4,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    stops: const [
                      .2,
                      .9
                    ],
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.2)
                    ])),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
