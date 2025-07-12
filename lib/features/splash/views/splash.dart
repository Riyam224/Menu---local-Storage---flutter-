// // ignore_for_file: use_build_context_synchronously, unused_field

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:meal_local_storage/core/constants.dart';
// import 'package:meal_local_storage/core/services/shared_prefernces_singleton.dart';
// import 'package:meal_local_storage/features/onboarding/views/onboarding_screen.dart';

// import '../../home/views/home_screen.dart';

// class Splash extends StatefulWidget {
//   const Splash({super.key});
//   static const routeName = '/splash';

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   bool _startAnimation = false;

//   @override
//   void initState() {
//     super.initState();
//     // Start scale animation
//     Future.delayed(Duration(milliseconds: 100), () {
//       setState(() {
//         _startAnimation = true;
//       });
//     });
//     // Smooth transition to next page after 2 seconds
//     Future.delayed(Duration(seconds: 2), () {
//       Navigator.of(context).pushReplacement(_createFadeRoute());
//     });
//     excuteNavigation();
//   }

//   Route _createFadeRoute() {
//     return PageRouteBuilder(
//       pageBuilder:
//           (context, animation, secondaryAnimation) => OnboardingScreen(),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(opacity: animation, child: child);
//       },
//       transitionDuration: Duration(milliseconds: 800),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: TweenAnimationBuilder<double>(
//           tween: Tween(begin: 1.0, end: _startAnimation ? 3.0 : 1.0),
//           duration: Duration(seconds: 2),
//           builder: (context, scale, child) {
//             return Transform.scale(
//               scale: scale,
//               child: Text(
//                 'HI',
//                 style: TextStyle(color: Colors.black, fontSize: 24),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   void excuteNavigation() {
//     bool isOnboardingViewSeen = SharedPreferncesSingleton.getBool(
//       kIsOnboardingViewSeen,
//     );
//     Future.delayed(Duration(seconds: 2), () {
//       if (isOnboardingViewSeen) {
//         GoRouter.of(context).goNamed(HomeScreen.routeName);
//       } else {
//         GoRouter.of(context).goNamed(OnboardingScreen.routeName);
//       }
//     });
//   }
// }

// ignore_for_file: use_build_context_synchronously, unused_field

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:meal_local_storage/core/constants.dart';
// import 'package:meal_local_storage/core/services/shared_prefernces_singleton.dart';
// import 'package:meal_local_storage/features/onboarding/views/onboarding_screen.dart';
// import '../../home/views/home_screen.dart';

// class Splash extends StatefulWidget {
//   const Splash({super.key});
//   static const routeName = '/splash';

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   bool _startAnimation = false;

//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(const Duration(milliseconds: 100), () {
//       setState(() {
//         _startAnimation = true;
//       });
//     });

//     // Safe navigation using post-frame callback
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _executeNavigation();
//     });
//   }

//   void _executeNavigation() async {
//     await Future.delayed(const Duration(seconds: 2));

//     final isOnboardingViewSeen = SharedPreferncesSingleton.getBool(
//       kIsOnboardingViewSeen,
//     );

//     if (!mounted) return;

//     if (isOnboardingViewSeen) {
//       context.goNamed(HomeScreen.routeName);
//     } else {
//       context.goNamed(OnboardingScreen.routeName);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: TweenAnimationBuilder<double>(
//           tween: Tween(begin: 1.0, end: _startAnimation ? 3.0 : 1.0),
//           duration: const Duration(seconds: 2),
//           builder: (context, scale, child) {
//             return Transform.scale(
//               scale: scale,
//               child: const Text(
//                 'HI',
//                 style: TextStyle(color: Colors.black, fontSize: 24),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   void excuteNavigation() {
//     bool isOnboardingViewSeen = SharedPreferncesSingleton.getBool(
//       kIsOnboardingViewSeen,
//     );
//     Future.delayed(Duration(seconds: 2), () {
//       if (isOnboardingViewSeen) {
//         GoRouter.of(context).goNamed(HomeScreen.routeName);
//       } else {
//         GoRouter.of(context).goNamed(OnboardingScreen.routeName);
//       }
//     });
//   }
// }

import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  static const routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(child: Text('Splash')),
    );
  }
}
