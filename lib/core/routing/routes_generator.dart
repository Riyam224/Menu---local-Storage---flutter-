import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_local_storage/core/routing/app_routes.dart';
import 'package:meal_local_storage/features/meal_details/views/meal_details.dart';
import 'package:meal_local_storage/features/onboarding/views/onboarding_screen.dart';
import '../../features/add_meal/views/add_meal.dart';
import '../../features/home/data/models/meal_model.dart';
import '../../features/home/views/home_screen.dart';
import '../../features/splash/views/splash.dart';

class RouteGenerator {
  static GoRouter mainRoutingInOurApp = GoRouter(
    errorBuilder:
        (context, state) =>
            const Scaffold(body: Center(child: Text('404 Not Found'))),
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const Splash(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => OnboardingScreen(),
      ),

      GoRoute(path: AppRoutes.home, builder: (context, state) => HomeScreen()),

      GoRoute(
        path: AppRoutes.addMeal,
        name: AppRoutes.addMeal,
        builder: (context, state) => AddMeal(),
      ),

      GoRoute(
        path: AppRoutes.mealDetails,
        name: AppRoutes.mealDetails,
        builder: (context, state) {
          Meal meal = state.extra as Meal;
          return MealDetails(meal: meal);
        },
      ),
    ],
  );
}
