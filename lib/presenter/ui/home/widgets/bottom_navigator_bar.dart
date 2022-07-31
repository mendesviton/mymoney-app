
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class PersonalizedBottomNavigation extends StatelessWidget {
  const PersonalizedBottomNavigation({
    Key? key,
    required StateController<bool> lightMode,
    required StateController<int> selectedIndex,
    required this.onButtonPressed,
  })  : _lightMode = lightMode,
        _selectedIndex = selectedIndex,
        super(key: key);

  final StateController<bool> _lightMode;
  final StateController<int> _selectedIndex;
  final Function(int) onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return SlidingClippedNavBar.colorful(
      backgroundColor: _lightMode.state
          ? Colors.white
          : const Color.fromARGB(255, 24, 24, 24),
      onButtonPressed: onButtonPressed,
      iconSize: 30,
      selectedIndex: _selectedIndex.state,
      barItems: <BarItem>[
        BarItem(
          icon: Icons.home,
          title: 'Início',
          activeColor: _lightMode.state ? Colors.amber : Colors.amber,
          inactiveColor: _lightMode.state
              ? Colors.amber
              : const Color.fromARGB(255, 60, 60, 60),
        ),
        BarItem(
          icon: Icons.add_circle_outline_outlined,
          title: 'A Receber',
          activeColor: _lightMode.state ? Colors.red : Colors.amber,
          inactiveColor: _lightMode.state
              ? Colors.red
              : const Color.fromARGB(255, 60, 60, 60),
        ),
        BarItem(
          icon: Icons.do_not_disturb_on_outlined,
          title: 'A Pagar',
          activeColor:
              _lightMode.state ? Colors.deepPurpleAccent : Colors.amber,
          inactiveColor: _lightMode.state
              ? Colors.deepPurpleAccent
              : const Color.fromARGB(255, 60, 60, 60),
        ),
        BarItem(
          icon: Icons.attach_money,
          title: 'Livro Caixa',
          activeColor: _lightMode.state ? Colors.pinkAccent : Colors.amber,
          inactiveColor: _lightMode.state
              ? Colors.pinkAccent
              : const Color.fromARGB(255, 60, 60, 60),
        ),
      ],
    );
  }
}
