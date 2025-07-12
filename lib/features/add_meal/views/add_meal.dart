// ignore_for_file: use_build_context_synchronously, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_local_storage/core/styles/app_colors.dart';
import 'package:meal_local_storage/features/home/views/home_screen.dart';
import '../../../core/styles/text_styles.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/primary_button_widget.dart';
import '../../../core/widgets/spacing_widgets.dart';
import '../../home/data/db_helper/db_helper.dart';
import '../../home/data/models/meal_model.dart';

class AddMeal extends StatefulWidget {
  AddMeal({super.key});

  static const routeName = '/add-meal';

  @override
  State<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController mealNameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Add Meal"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child:
                isLoading == true
                    ? SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: SizedBox(
                          width: 40.sp,
                          height: 40.sp,
                          child: const CircularProgressIndicator(
                            color: AppColors.primaryOrange,
                          ),
                        ),
                      ),
                    )
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Meal Name", style: TextStyles.Inter16SemiBold),
                        const HeightSpace(8),
                        CustomTextField(
                          controller: mealNameController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add meal name";
                            } else if (val.length < 3) {
                              return "please add more than 3 characters";
                            }
                            return null;
                          },
                        ),
                        const HeightSpace(16),
                        Text("Image URl", style: TextStyles.Inter16SemiBold),
                        const HeightSpace(8),
                        CustomTextField(
                          controller: imageUrlController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add image url ";
                            }
                            return null;
                          },
                        ),
                        const HeightSpace(16),
                        Text("Rate", style: TextStyles.Inter16SemiBold),
                        const HeightSpace(8),
                        CustomTextField(
                          controller: rateController,
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add rate";
                            }
                            return null;
                          },
                        ),
                        const HeightSpace(16),
                        Text("Time", style: TextStyles.Inter16SemiBold),
                        const HeightSpace(8),
                        CustomTextField(
                          controller: timeController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add Time for Meal";
                            }
                            return null;
                          },
                        ),
                        const HeightSpace(16),
                        Text("Description", style: TextStyles.Inter16SemiBold),
                        const HeightSpace(8),
                        CustomTextField(
                          controller: descriptionController,
                          maxLines: 4,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add Time for Meal";
                            }
                            return null;
                          },
                        ),
                        const HeightSpace(70),
                        PrimayButtonWidget(
                          buttonText: "Add Meal",
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              // todo save to database
                              Meal meal = Meal(
                                name: mealNameController.text,
                                imageUrl: imageUrlController.text,
                                rate: double.parse(rateController.text),
                                description: descriptionController.text,
                                time: timeController.text,
                              );

                              dbHelper.insertMeal(meal).then((value) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => HomeScreen(),
                                  ),
                                );
                              });
                            }
                          },
                        ),
                        const HeightSpace(20),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
