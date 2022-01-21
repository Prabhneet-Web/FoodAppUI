import 'package:flutter/material.dart';
import 'package:food_delivery_app/animations/fadeAnimation.dart';
import 'package:food_delivery_app/pages/homePage.dart';
import 'package:page_transition/page_transition.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({Key? key}) : super(key: key);

  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _textVisible = true;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));

    _animation =
        Tween<double>(begin: 1.0, end: 25.0).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void onTap() {
    setState(() {
      _textVisible = false;
    });
    _animationController.forward().then((f) => Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: HomePage())));
  }

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
                  1.5,
                  const Text(
                    "Taking Order for Faster Delivery!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                FadeAnimation(
                    1.7,
                    const Text(
                        "See restaurants nearby by \nadding the location",
                        style: TextStyle(
                            color: Colors.white, height: 1.4, fontSize: 18))),
                const SizedBox(height: 20),
                FadeAnimation(
                  1.9,
                  ScaleTransition(
                    scale: _animation,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              colors: [Colors.yellow, Colors.orange])),
                      child: AnimatedOpacity(
                        opacity: _textVisible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 50),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          child: const Text("Start",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          onPressed: () => onTap(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 50),
                  opacity: _textVisible ? 1.0 : 0.0,
                  child: Align(
                    child: FadeAnimation(
                      2.2,
                      const Text(
                        "Now Delivery To Your Door 24/7",
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),
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
