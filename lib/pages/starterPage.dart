import 'package:flutter/material.dart';
import 'package:food_delivery_app/animations/fadeAnimation.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({Key? key}) : super(key: key);

  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/images/starter.jpg"),
              fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.8),
            Colors.black.withOpacity(0.2)
          ])),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimation(
                  1,
                  const Text(
                    "Taking Order for Delivery!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                FadeAnimation(
                    1.3,
                    const Text(
                        "See restaurants nearby by \nadding the location",
                        style: TextStyle(
                            color: Colors.white, height: 1.4, fontSize: 18))),
                const SizedBox(height: 20),
                FadeAnimation(
                  1.6,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                            colors: [Colors.yellow, Colors.orange])),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      child: FadeAnimation(
                        1.8,
                        const Text(
                          "Start",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  child: FadeAnimation(
                    2,
                    const Text(
                      "Now Delivery To Your Door 24/7",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
