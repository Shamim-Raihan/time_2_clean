import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:time_2_clean/screens/auth_screens/controller/auth_controller.dart';
import 'package:time_2_clean/utils/color_helper.dart';
import 'package:time_2_clean/utils/custom_tex_filed.dart';
import 'package:time_2_clean/utils/space_helper.dart';
import 'package:time_2_clean/utils/style_helper.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
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
              topBackButton(context),
              topImg(context),
              inputfiled(context),
              footer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget topBackButton(BuildContext context) {
    return Positioned(
      top: 40.h,
      left: 20.w,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 30.w,
          height: 25.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xff7D7D7D)),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: const Color(0xff7D7D7D),
              size: 15.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget inputfiled(context) {
    return Positioned(
        top: 80.h,
        left: 30.w,
        right: 30.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: StyleHelper.headline1,
            ),
            SpaceHelper.verticalSpace15,
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'By click the sign up button, you’re agree to  ',
                      style: StyleHelper.agreeText),
                  TextSpan(text: 'Time 2 ', style: StyleHelper.agreeTextBold),
                  TextSpan(
                      text: 'Cleann’s Terms and Service ',
                      style: StyleHelper.agreeTextBold),
                  TextSpan(
                      text: 'and acknlowledge the',
                      style: StyleHelper.agreeText),
                  TextSpan(
                      text: '\nPrivacy and Policy',
                      style: StyleHelper.agreeTextBold),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            SpaceHelper.verticalSpace15,
            Text(
              'Name',
              style: StyleHelper.title,
            ),
            SpaceHelper.verticalSpace10,
            CustomTextField(
              hintText: 'Enter user name',
              controller: _authController.nameController.value,
            ),
            SpaceHelper.verticalSpace10,
            Text(
              'Email',
              style: StyleHelper.title,
            ),
            SpaceHelper.verticalSpace10,
            CustomTextField(
              hintText: 'Enter your email',
              controller: _authController.emailController.value,
            ),
            SpaceHelper.verticalSpace10,
            Text(
              'Password',
              style: StyleHelper.title,
            ),
            SpaceHelper.verticalSpace10,
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
            SpaceHelper.verticalSpace10,
            Text(
              'Confirm Password',
              style: StyleHelper.title,
            ),
            SpaceHelper.verticalSpace10,
            Obx(
              () => CustomTextField(
                hintText: 'Re-type password',
                controller: _authController.confirmPassController.value,
                suffixIcon: InkWell(
                  onTap: () {
                    _authController.confirmObscureText.value =
                        !_authController.confirmObscureText.value;
                  },
                  child: Icon(
                    _authController.confirmObscureText.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: const Color(0xffABB3BB),
                  ),
                ),
                obscureText: _authController.confirmObscureText.value,
              ),
            ),
            SpaceHelper.verticalSpace10,
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    activeColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.r)),
                    value: _authController.isAgree.value,
                    onChanged: (bool? newValue) {
                      if (newValue != null) {
                        _authController.isAgree.value = newValue;
                      }
                    },
                  ),
                ),
                Text(
                  'Accept term of  service',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: const Color(0xff125EC4)),
                ),
              ],
            ),
            SpaceHelper.verticalSpace10,
            Container(
              width: 334.w,
              height: 40.h,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: ColorHelper.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Center(
                child: Text(
                  'Sign Up',
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
      child: Image.asset(
        'assets/images/bottomImgForSignUp.png',
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        height: 170.h,
      ),
    );
  }
}
