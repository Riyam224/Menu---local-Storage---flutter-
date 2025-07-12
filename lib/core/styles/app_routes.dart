import 'package:flutter/material.dart';
import 'package:meal_local_storage/features/home/views/home_screen.dart';
import 'package:meal_local_storage/features/splash/views/splash.dart';

import '../../features/add_meal/views/add_meal.dart';

import '../../features/onboarding/views/onboarding_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/splash':
      return MaterialPageRoute(builder: (_) => Splash());
    case '/onboarding':
      return MaterialPageRoute(builder: (_) => OnboardingScreen());

    case '/home':
      return MaterialPageRoute(builder: (_) => HomeScreen());

    case '/add-meal':
      return MaterialPageRoute(builder: (_) => AddMeal());
    default:
      return MaterialPageRoute(
        builder:
            (_) => const Scaffold(body: Center(child: Text('404 Not Found'))),
      );
  }
}
