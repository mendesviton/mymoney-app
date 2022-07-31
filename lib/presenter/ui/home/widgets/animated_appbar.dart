
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnimatedAppbar extends StatelessWidget {
  final StateController<bool> lightMode;
  Function appBarColor;
  Function getPageName;
  AnimatedAppbar({
    Key? key,
    required this.lightMode,
    required this.appBarColor,
    required this.getPageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      color: lightMode.state ? appBarColor() : Color.fromARGB(255, 24, 24, 24),
      curve: Curves.linear,
      child: ListTile(
        trailing: IconButton(
            style: const ButtonStyle(
                animationDuration: Duration(milliseconds: 500)),
            splashColor: Colors.transparent,
            icon: Icon(lightMode.state
                ? Icons.wb_sunny_outlined
                : Icons.dark_mode_outlined),
            onPressed: () {
              lightMode.state = !lightMode.state;
            }),
        leading: SizedBox(),
        iconColor: Colors.white,
        // activeColor: Colors.white,
        title: Center(
          child: Text(
            getPageName(),
            style: GoogleFonts.oxygen(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
