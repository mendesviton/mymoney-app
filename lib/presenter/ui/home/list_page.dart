import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pay/pay_page.dart';
import '../receive/receive_page.dart';
import '../total/total_page.dart';
import 'widgets/body_home.dart';

class PageWidgets {
  PageWidgets({
    required this.lightmode,
  });

  final bool lightmode;

  final double _iconSize = 200;

  double get iconsize {
    return _iconSize;
  }

  Color getColorMode(Color lightModeColor) {
    return lightmode ? lightModeColor : const Color.fromARGB(255, 34, 34, 34);
  }

  TextStyle fontstyle = GoogleFonts.oxygen(
      fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);

//lista de telas
  List<Widget> listScreen() {
    return [
      HomePage(lightmode: lightmode, iconsize: iconsize),

      ReceivePage(lightmode: lightmode, fontstyle: fontstyle),

      PayPage(lightmode: lightmode, fontstyle: fontstyle),

      TotalPage(lightmode: lightmode, fontstyle: fontstyle),
    ];
  }
}
