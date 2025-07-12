// ignore_for_file: deprecated_member_use, prefer_const_constructors_in_immutables, unused_element

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_local_storage/core/assets.dart';
import 'package:meal_local_storage/core/styles/app_colors.dart';
import 'package:meal_local_storage/core/styles/text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});
  static const String routeName = '/onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<Map<String, dynamic>> onboardingData = [
    {
      'title': 'Save Your Meals Ingredient',
      'description':
          'Add Your Meals and its Ingredients and we will save it for you',
    },
    {
      'title': 'Use Our App The Best Choice',
      'description': 'The best choice for your kitchen, don’t hesitate!',
    },
    {
      'title': 'Our App Your Ultimate Choice',
      'description':
          'All the best restaurants and their top menus are ready for you',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.resourceImagesOnboarding),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Orange Card & Carousel
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Container(
                width: 311.w,
                height: 400.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryOrange.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(48),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryOrange.withOpacity(0.7),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 22.h),

                    /// Carousel Slider
                    CarouselSlider(
                      items:
                          onboardingData.map((data) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data['title'],
                                    textAlign: TextAlign.center,
                                    style: TextStyles.onBoardingtitle,
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    data['description'],
                                    textAlign: TextAlign.center,
                                    style: TextStyles.onBoardingSubtitle,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                      carouselController: _controller,
                      options: CarouselOptions(
                        height: 220.h,
                        enlargeCenterPage: true,
                        autoPlay: false,
                        enableInfiniteScroll: false,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),

                    SizedBox(height: 20.h),

                    /// Dot Indicator using smooth_page_indicator
                    AnimatedSmoothIndicator(
                      activeIndex: _currentIndex,
                      count: onboardingData.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: AppColors.whiteColor,
                        dotColor: AppColors.greyColor,
                        dotHeight: 10,
                        dotWidth: 10,
                        expansionFactor: 2,
                        spacing: 6,
                      ),
                      onDotClicked: (index) {
                        _controller.animateToPage(index);
                      },
                    ),
                    SizedBox(height: 30.h),

                    /// Skip, Next, and Center Button for the 3rd page

                    /// Buttons for First and Second Pages
                    if (_currentIndex != 2)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                //! Set isOnboardingViewSeen to true
                                // SharedPreferncesSingleton.setBool(
                                //   kIsOnboardingViewSeen,
                                //   true,
                                // );
                                GoRouter.of(context).pushNamed('/home');
                                _controller.jumpToPage(2); // Skip to last page
                              },
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _controller.nextPage(); // Move to next page
                              },
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    /// Only Button on the 3rd Carousel Page
                    if (_currentIndex == 2)
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pushNamed('/home');
                        },
                        child: Center(
                          child: Container(
                            width: 62.w,
                            height: 62.h,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(62),
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: AppColors.primaryOrange,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
