// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_local_storage/core/assets.dart';
import 'package:meal_local_storage/core/styles/app_colors.dart';
import 'package:meal_local_storage/core/styles/text_styles.dart';
import 'package:meal_local_storage/features/home/views/widgets/custom_food_item.dart';

import '../../../core/routing/app_routes.dart';
import '../data/db_helper/db_helper.dart';
import '../data/models/meal_model.dart';

// todo
DatabaseHelper dbHelper = DatabaseHelper.instance;

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const String routeName = '/home';

  // todo

  // ignore: use_key_in_widget_constructors

  @override
  Widget build(BuildContext context) {
    // todo
    // dbHelper.insertMeal(
    //   Meal(
    //     imageUrl:
    //         "https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    //     name: 'burger',
    //     description: 'burger is a fast food',
    //     time: '10 min',
    //     rate: 5,
    //   ),
    // );
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: 632.w,
                height: 346.h,
                child: Image.asset(Assets.resourceImagesDetailsMealMain),
              ),
              Positioned(
                top: 100,
                left: 10,
                child: SizedBox(
                  width: 272,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, top: 40),
                    child: Text(
                      'Welcome Add A New Recipe',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text('Your Food', style: TextStyles.Inter16SemiBold),
          ),

          Expanded(
            child: FutureBuilder(
              future: dbHelper.getMeals(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryOrange,
                    ),
                  );
                } else if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        "No Meals Found",
                        style: TextStyles.Inter14SemiBoldButton,
                      ),
                    );
                  }
                  return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 22.sp,
                      crossAxisSpacing: 16.sp,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      Meal meal = snapshot.data![index];
                      return FoodItemWidget(
                        imageUrl: meal.imageUrl,
                        name: meal.name,
                        rate: meal.rate,
                        time: meal.time,
                        onTap: () {
                          GoRouter.of(
                            context,
                          ).pushNamed(AppRoutes.mealDetails, extra: meal);
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                }

                return Container();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryOrange,
        child: Icon(Icons.add, color: Colors.white, size: 30.sp),
        onPressed: () {
          GoRouter.of(context).pushNamed(AppRoutes.addMeal);
        },
      ),
    );
  }
}

class MealItem extends StatelessWidget {
  MealItem({super.key, required this.image, required this.title});

  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        width: 153,
        height: 176,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              width: 137,
              height: 106,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF0F0F0F),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 1.50,
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: 137,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(Assets.resourceImagesStar),
                      SizedBox(width: 5.w),
                      Text(
                        '4.8',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(Assets.resourceImagesSubtract),
                      SizedBox(width: 5.w),
                      Text(
                        '20 - 30',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
