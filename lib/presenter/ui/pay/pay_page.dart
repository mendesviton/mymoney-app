import 'package:flutter/material.dart';

class PayPage extends StatelessWidget {
  const PayPage({
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
      color: lightmode
          ? Colors.deepPurpleAccent
          : const Color.fromARGB(255, 34, 34, 34),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.bolt,
            size: 200,
            color: Colors.white,
          ),
          Text("Energy", style: fontstyle),
        ],
      ),
    );
  }
}
