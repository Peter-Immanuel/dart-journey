import 'package:flutter/material.dart';
import 'dart:async';

class FooderlichTab {
  static const int explore = 0;
  static const int recipes = 1;
  static const int toBuy = 2;
}

class AppStateManager extends ChangeNotifier {
  bool _isInitialized = false;
  bool _loggedIn = false;
  bool _onboardingCompleted = false;
  int _selectedTab = FooderlichTab.explore;

  bool get isInitialized => isInitialized;
  bool get loggedIn => _loggedIn;
  bool get onboardingCompleted => onboardingCompleted;
  int get selectedTab => _selectedTab;

  // initializeApp
  void initializeApp() {
    Timer(const Duration(milliseconds: 2000), () {
      _isInitialized = true;
      notifyListeners();
    });
  }

  // login
  void login(String username, String password) {
    // In a real situation an API call s
    _loggedIn = true;
    notifyListeners();
  }

  // completeOnboarding
  void completedOnboarding() {
    _onboardingCompleted = true;
    notifyListeners();
  }

  // goToTab
  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  // goToRecipes
  void goToRecipes() {
    _selectedTab = FooderlichTab.recipes;
    notifyListeners();
  }

  // Add logout
  void logout() {
    _isInitialized = false;
    _loggedIn = false;
    _onboardingCompleted = false;
    _selectedTab = 0;
    initializeApp();
    notifyListeners();
  }
}
