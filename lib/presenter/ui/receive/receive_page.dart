import 'package:flutter/material.dart';

class ReceivePage extends StatelessWidget {
  const ReceivePage({
    Key? key,
    required this.lightmode,
    required this.fontstyle,
  }) : super(key: key);

  final bool lightmode;
  final TextStyle fontstyle;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.slowMiddle,
      duration: const Duration(milliseconds: 200),
      alignment: Alignment.center,
      color: lightmode ? Colors.red : const Color.fromARGB(255, 34, 34, 34),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search,
            size: 200,
            color: Colors.white,
          ),
          Text("Search", style: fontstyle),
        ],
      ),
    );
  }
}