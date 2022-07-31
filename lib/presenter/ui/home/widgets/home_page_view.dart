import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePageView extends StatelessWidget {
  final PageController pageControllerState;
  final StateController<int> selectedIndexState;
  final List<Widget> ScreenList;
  const HomePageView({
    Key? key,
    required this.pageControllerState,
    required this.selectedIndexState,
    required this.ScreenList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: pageControllerState,
      children: ScreenList,
      onPageChanged: (value) {
        selectedIndexState.state = value;
      },
    );
  }
}