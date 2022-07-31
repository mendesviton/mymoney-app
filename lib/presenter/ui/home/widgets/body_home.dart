import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.lightmode,
    required this.iconsize,
  }) : super(key: key);

  final bool lightmode;
  final double iconsize;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.slowMiddle,
      duration: const Duration(milliseconds: 200),
      color: lightmode ? Colors.amber : const Color.fromARGB(255, 34, 34, 34),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home,
            size: iconsize,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
