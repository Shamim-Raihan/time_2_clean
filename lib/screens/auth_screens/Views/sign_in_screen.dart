import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:time_2_clean/screens/auth_screens/Views/sign_up_screen.dart';
import 'package:time_2_clean/screens/auth_screens/controller/auth_controller.dart';
import 'package:time_2_clean/utils/color_helper.dart';
import 'package:time_2_clean/utils/custom_tex_filed.dart';
import 'package:time_2_clean/utils/space_helper.dart';
import 'package:time_2_clean/utils/style_helper.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              topImg(context),
              subtop(context),
              inputfiled(context),
              subBottomImg(context),
              footer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputfiled(context) {
    return Positioned(
        top: 120.h,
        left: 30.w,
        right: 30.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign In',
              style: StyleHelper.headline1,
            ),
            SpaceHelper.verticalSpace15,
            Text(
              'Email',
              style: StyleHelper.title,
            ),
            SpaceHelper.verticalSpace15,
            CustomTextField(
              hintText: 'Enter your email',
              controller: _authController.emailController.value,
            ),
            SpaceHelper.verticalSpace15,
            Text(
              'Password',
              style: StyleHelper.title,
            ),
            SpaceHelper.verticalSpace15,
            Obx(
              () => CustomTextField(
                hintText: 'Enter your password',
                controller: _authController.passController.value,
                suffixIcon: InkWell(
                  onTap: () {
                    _authController.obscureText.value =
                        !_authController.obscureText.value;
                  },
                  child: Icon(
                    _authController.obscureText.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: const Color(0xffABB3BB),
                  ),
                ),
                obscureText: _authController.obscureText.value,
              ),
            ),
            SpaceHelper.verticalSpace15,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: const Color(0xffD0D0D0),
                        ),
                        child: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.r)),
                          value: _authController.isRemember.value,
                          onChanged: (bool? newValue) {
                            if (newValue != null) {
                              _authController.isRemember.value = newValue;
                            }
                          },
                        ),
                      ),
                    ),
                    // SpaceHelper.horizontalSpace5,
                    Text(
                      'Remember me',
                      style: StyleHelper.subtitle,
                    )
                  ],
                ),
                Text(
                  'Forgot password?',
                  style: TextStyle(
                      fontSize: 12.sp, color: const Color(0xff125EC4)),
                )
              ],
            ),
            SpaceHelper.verticalSpace25,
            Container(
              width: 334.w,
              height: 40.h,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: ColorHelper.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Center(
                child: Text(
                  'Sign in',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget subtop(BuildContext context) {
    return Positioned(
        top: 104,
        child: Image.asset(
          'assets/images/time 2 cleann 2.png',
          width: MediaQuery.of(context).size.width,
          height: 30.h,
        ));
  }

  Widget topImg(BuildContext context) {
    return Positioned(
        top: 0,
        child: Image.asset(
          'assets/images/topImg.png',
          width: MediaQuery.of(context).size.width - 30.w,
          height: 200.h,
          fit: BoxFit.fill,
        ));
  }

  Widget footer(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/bottomImg.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            height: 200.h,
          ),
          Positioned(
            bottom: 0.h,
            left: 30.w,
            right: 30.w,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1.h,
                      width: 96.w,
                      color: Colors.white,
                    ),
                    SpaceHelper.horizontalSpace10,
                    Text(
                      'Or Continue with',
                      style: TextStyle(
                          color: const Color(0xffABB3BB),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SpaceHelper.horizontalSpace10,
                    Container(
                      height: 1.h,
                      width: 96.w,
                      color: Colors.white,
                    )
                  ],
                ),
                SpaceHelper.verticalSpace10,
                signInOptions(),
                SpaceHelper.verticalSpace10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have account?',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    SpaceHelper.horizontalSpace5,
                    InkWell(
                      onTap: () {
                        Get.offAll(() => SignupScreen());
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
                SpaceHelper.verticalSpace20,
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget signInOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        googleSignin(),
        facbookSignin(),
      ],
    );
  }

  Widget facbookSignin() {
    return Container(
      height: 50.h,
      width: 120.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: const Color(0xff298FFF),
      ),
      child: Center(
          child: Image.asset(
        'assets/images/facbookSignin.png',
        height: 20.h,
        width: 80.w,
      )),
    );
  }

  Widget googleSignin() {
    return Container(
      height: 50.h,
      width: 120.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: Colors.white,
      ),
      child: Center(
          child: Image.asset(
        'assets/images/googleSignin.png',
        height: 20.h,
        width: 80.w,
        fit: BoxFit.cover,
      )),
    );
  }

  Widget subBottomImg(BuildContext context) {
    return Positioned(
      bottom: 153.h,
      child: Image.asset(
        'assets/images/bottomGroupImg.png',
        width: MediaQuery.of(context).size.width - 30.w,
        height: 50.h,
      ),
    );
  }
}
