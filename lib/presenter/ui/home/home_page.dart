
import 'package:blurry/blurry.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'
    show HookConsumerWidget, WidgetRef;
import 'package:mymoney_project/presenter/ui/home/list_page.dart';
import 'package:mymoney_project/presenter/ui/home/widgets/animated_appbar.dart';
import 'package:mymoney_project/presenter/ui/widgets/shared/entry_page.dart';

import '../../../core/provider_state.dart';
import 'widgets/bottom_navigator_bar.dart';
import 'widgets/home_page_view.dart';

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _pageController = ref.watch(pageController);
    final _selectedIndex = ref.watch(selectedIndex.state);
    final _colorful = ref.watch(colorful.state);
    final _lightMode = ref.watch(lightMode.state);

    PageWidgets widgets = PageWidgets(lightmode: _lightMode.state);

    void onButtonPressed(int index) {
      _selectedIndex.state = index;

      _pageController.animateToPage(_selectedIndex.state,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutQuad);
    }

    Color appBarColor() {
      switch (_selectedIndex.state) {
        case (0):
          return Colors.amber;
        case (1):
          return Colors.red;
        case (2):
          return Colors.deepPurpleAccent;
        case (3):
          return Colors.pinkAccent;
        default:
          return Colors.transparent;
      }
    }

    String getPageName() {
      switch (_selectedIndex.state) {
        case (0):
          return 'Início';
        case (1):
          return 'Recebimento';
        case (2):
          return 'Saídas';
        case (3):
          return 'Livro Caixa';
        default:
          return 'null';
      }
    }

    return Scaffold(
        floatingActionButton:
            (_selectedIndex.state != 3 && _selectedIndex.state != 0)
                ? FloatingActionButton(
                    elevation: 15,
                    splashColor: _lightMode.state
                        ? appBarColor()
                        : const Color.fromARGB(255, 34, 34, 34),
                    onPressed: () {
                      EntryPage(
                              textbutton: 'textbutton',
                              text: 'text',
                              icon: Icons.abc,
                              buttonColor: Colors.black12,
                              iconColor: Colors.black12)
                          .showCustomDialog(context);

                      // Blurry.input(
                      //   title: 'Blurry Input',
                      //   description:
                      //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                      //   confirmButtonText: 'Confirm',
                      //   onConfirmButtonPressed: () {},
                      //   inputLabel: 'Email',
                      //   themeColor: Colors.red,
                      //   icon: Icons.reduce_capacity_outlined,
                      //   inputTextController: TextEditingController(),
                      // ).show(context);
                    },
                    backgroundColor: _lightMode.state
                        ? Colors.cyan
                        : const Color.fromARGB(255, 24, 24, 24),
                    child: const Icon(Icons.add),
                  )
                : null,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Custom AppBar
              AnimatedAppbar(
                  lightMode: _lightMode,
                  appBarColor: appBarColor,
                  getPageName: getPageName),

              /// Main Body
              Expanded(
                child: HomePageView(
                    ScreenList:
                        PageWidgets(lightmode: _lightMode.state).listScreen(),
                    pageControllerState: _pageController,
                    selectedIndexState: _selectedIndex),
              ),
            ],
          ),
        ),

        /// Bottom Navigation Bar
        bottomNavigationBar: PersonalizedBottomNavigation(
            onButtonPressed: onButtonPressed,
            lightMode: _lightMode,
            selectedIndex: _selectedIndex));
  }
}
