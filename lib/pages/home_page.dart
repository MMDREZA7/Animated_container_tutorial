import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double boxHeight = 50;
  double boxWidth = 50;
  var boxColor = Colors.deepPurple;
  var boxAlingment = const Alignment(0, -1);

  void _expandBox() async {
    // go down
    setState(() {
      // boxHeight = 300;
      // boxWidth = 300;
      // boxColor = Colors.orange;

      boxAlingment = const Alignment(0, -0.5);
    });

    await Future.delayed(
      const Duration(seconds: 4),
    );

    // go right
    setState(() {
      boxAlingment = const Alignment(0.5, -0.5);
    });

    await Future.delayed(
      const Duration(seconds: 3),
    );

    // go down
    setState(() {
      boxAlingment = const Alignment(0.5, -0);
    });

    await Future.delayed(
      const Duration(seconds: 5),
    );

    // go left
    setState(() {
      boxAlingment = const Alignment(0.25, -0);
    });

    await Future.delayed(
      const Duration(seconds: 1),
    );

    // go left-down
    setState(() {
      boxAlingment = const Alignment(-0.5, 0.5);
    });
  }

  void _changeBoxColor() {
    setState(() {
      boxAlingment = const Alignment(0.5, -0);
    });

    Future.delayed(
      const Duration(seconds: 3),
    );

    setState(() {
      boxColor = Colors.blue;
      boxHeight = 300;
      boxWidth = 300;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _expandBox,
      onDoubleTap: _changeBoxColor,
      child: Scaffold(
        backgroundColor: Colors.deepPurple[200],
        body: Center(
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            curve: Curves.easeInOutCirc,
            alignment: boxAlingment,
            child: Container(
              width: boxWidth,
              height: boxHeight,
              color: boxColor,
            ),
          ),
        ),
      ),
    );
  }
}
