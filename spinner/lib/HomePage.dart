import 'package:flutter/material.dart';
import 'package:spinner/Spinners.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation spinner;

  int active;

  @override
  void initState() {
    super.initState();
    active = 0;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );
    spinner = Tween(begin: 0.0, end: 1000.0).animate(controller);
  }

  change(int x) {
    setState(() {
      active = x;
    });
  }

  spin() {
    controller.forward(from: 0.0);
    setState(() {
      spinner = Tween(begin: 0.0, end: 1000.0).animate(controller);
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: data.size.width * 0.45,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: data.size.height * 0.09),
              child: Spinners(
                active: active,
                change: change,
              ),
            ),
            Container(
              height: data.size.width * 0.7,
              width: data.size.width * 0.7,
              decoration: BoxDecoration(
                color: Colors.purple[800],
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple[900],
                    offset: Offset(5, 5),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Colors.purple[700],
                    offset: Offset(-5, -5),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: RotationTransition(
                turns: spinner,
                child: Center(
                  child: Image.asset(
                    'images/S${active + 1}.png',
                    height: data.size.width * 0.6,
                    width: data.size.width * 0.6,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: spin,
              child: Container(
                height: data.size.width * 0.2,
                width: data.size.width * 0.3,
                decoration: BoxDecoration(
                  color: Colors.purple[800],
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple[900],
                      offset: Offset(5, 5),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: Colors.purple[700],
                      offset: Offset(-5, -5),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'SPIN',
                    style: TextStyle(
                      color: Color(0xFF140126),
                      fontWeight: FontWeight.w700,
                      fontSize: data.size.width * 0.08,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
