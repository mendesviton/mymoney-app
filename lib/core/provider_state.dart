import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedIndex = StateProvider<int>(((ref) => 0));

final pageController = StateProvider<PageController>(
    ((ref) => PageController(initialPage: ref.watch(selectedIndex))));

final lightMode = StateProvider<bool>(((ref) => true));

final colorful = StateProvider<bool>(((ref) => true));
