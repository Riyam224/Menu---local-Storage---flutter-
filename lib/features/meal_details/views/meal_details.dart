// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_local_storage/core/styles/app_colors.dart';

import '../../../core/styles/text_styles.dart';
import '../../../core/widgets/spacing_widgets.dart';
import '../../home/data/models/meal_model.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.meal});

  final Meal meal;
  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryOrange,
          title: Text(
            'Meal Details',
            style: TextStyles.Inter14SemiBoldButton.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: CachedNetworkImage(
                        imageUrl: meal.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 327.h,
                      ),
                    ),
                    Positioned(
                      left: 12.w,
                      top: 12.h,
                      child: InkWell(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(12.sp),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.whiteColor,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpace(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.name,
                      style: TextStyles.Inter14SemiBoldButton.copyWith(
                        color: Colors.black,
                        fontSize: 24.sp,
                      ),
                    ),
                    const HeightSpace(21),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(
                        color: AppColors.primaryOrange.withOpacity(0.04),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.lock_clock,
                                color: AppColors.primaryOrange,
                                size: 16.sp,
                              ),
                              const WidthSpace(4),
                              Text(
                                meal.time.toString(),
                                style: TextStyles
                                    .Inter14SemiBoldButton.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.primaryOrange,
                                size: 16.sp,
                              ),
                              const WidthSpace(4),
                              Text(
                                meal.rate.toString(),
                                style: TextStyles
                                    .Inter14SemiBoldButton.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const HeightSpace(27),
                    const Divider(thickness: 2),
                    const HeightSpace(24),
                    Text(
                      "Description",
                      style: TextStyles.Inter16SemiBoldWhitedesc,
                    ),
                    const HeightSpace(8),
                    Text(
                      meal.description,
                      style: TextStyles.Inter14SemiBoldButton,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
