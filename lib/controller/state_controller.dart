// Simple state controller for bottom navigation
import 'package:flutter/material.dart';

class NavigationController {
  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);
  
  void updateIndex(int index) {
    selectedIndexNotifier.value = index;
  }
  
  void dispose() {
    selectedIndexNotifier.dispose();
  }
}
