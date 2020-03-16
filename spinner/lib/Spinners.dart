import 'package:flutter/material.dart';

final activeDecoration = BoxDecoration(
  color: Colors.purple[800],
  borderRadius: BorderRadius.circular(
    10.0,
  ),
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
);

final notActiveDecoration = BoxDecoration(
  color: Colors.purple[800],
  borderRadius: BorderRadius.circular(
    10.0,
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.purple[900],
      offset: Offset(-5, -5),
      blurRadius: 15.0,
      spreadRadius: 1.0,
    ),
    BoxShadow(
      color: Colors.purple[700],
      offset: Offset(5, 5),
      blurRadius: 15.0,
      spreadRadius: 1.0,
    ),
  ],
);

class Spinners extends StatelessWidget {
  final int active;
  final Function change;

  Spinners({
    this.active,
    this.change,
  });

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(9, (index) {
        String image = 'images/S${index + 1}.png';
        return Row(
          children: <Widget>[
            SizedBox(
              width: data.size.width * 0.05,
            ),
            GestureDetector(
              onTap: () {
                change(index);
              },
              child: Container(
                height: data.size.width * 0.25,
                width: data.size.width * 0.25,
                decoration:
                    (active == index ? notActiveDecoration : activeDecoration),
                child: Center(
                  child: Image.asset(
                    image,
                    height: data.size.width * 0.2,
                    width: data.size.width * 0.2,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
