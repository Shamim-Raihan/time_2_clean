import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pinput/pinput.dart';
import 'package:time_2_clean/screens/auth_screens/controller/auth_controller.dart';
import 'package:time_2_clean/screens/home/views/home_screen.dart';
import 'package:time_2_clean/utils/color_helper.dart';
import 'package:time_2_clean/utils/space_helper.dart';
import 'package:time_2_clean/utils/style_helper.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
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
              _buildTopImgView(context),
              _buildFooterView(context),
              _buildLogoView(context),
              Obx(() => _authController.otpSubmitted.value
                  ? _buildOTPVerification(context)
                  : _buildNumberPicker(context)),
              _buildtopBackButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildtopBackButton(BuildContext context) {
    return Positioned(
      top: 40.h,
      left: 20.w,
      child: InkWell(
        onTap: () {
          _authController.otpSubmitted.value
              ? _authController.otpSubmitted.value = false
              : Navigator.pop(context);
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

  Widget _buildTopImgView(BuildContext context) {
    return Positioned(
        top: 0,
        child: Image.asset(
          'assets/images/topImg.png',
          width: MediaQuery.of(context).size.width - 30.w,
          height: 200.h,
          fit: BoxFit.fill,
        ));
  }

  Widget _buildFooterView(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/bottomImg.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            height: 180.h,
          ),
        ],
      ),
    );
  }

  Widget _buildLogoView(BuildContext context) {
    return Positioned(
        bottom: 170.h,
        child: Column(
          children: [
            Image.asset(
              'assets/images/brush.png',
              width: MediaQuery.of(context).size.width,
              height: 55.h,
            ),
            SizedBox(
              height: 15.h,
            ),
            Image.asset(
              'assets/images/time 2 cleann 2.png',
              width: MediaQuery.of(context).size.width,
              height: 36.h,
            ),
          ],
        ));
  }

  Widget _buildNumberPicker(BuildContext context) {
    return Positioned(
      bottom: 260.h,
      child: SizedBox(
        height: 350.h,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verify your phone number',
                style: StyleHelper.headline1,
              ),
              SpaceHelper.verticalSpace15,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'We have send you an ',
                        style: StyleHelper.agreeText),
                    TextSpan(
                        text: 'One Time Password(OTP) ',
                        style: StyleHelper.agreeTextBold),
                    TextSpan(
                        text: 'on this mobile number',
                        style: StyleHelper.agreeText),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              SpaceHelper.verticalSpace30,
              Text(
                'Enter mobile no.*',
                style: StyleHelper.title,
              ),
              SpaceHelper.verticalSpace10,
              SizedBox(
                height: 45.h,
                width: MediaQuery.of(context).size.width,
                child: InternationalPhoneNumberInput(
                  textFieldController: _authController.phoneNumbercontroller,
                  onInputValidated: (bool value) {
                    if (kDebugMode) {
                      print(value);
                    }
                  },
                  selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.DROPDOWN,
                      showFlags: true,
                      useBottomSheetSafeArea: false,
                      useEmoji: true,
                      leadingPadding: 0.0,
                      setSelectorButtonAsPrefixIcon: false,
                      trailingSpace: false),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: const TextStyle(color: Colors.black),
                  formatInput: true,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorHelper.primaryColor)),
                  inputDecoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorHelper
                                .primaryColor)), // Add border to the entire input field
                  ),
                  onSaved: (PhoneNumber number) {
                    if (kDebugMode) {
                      print('On Saved: $number');
                    }
                  },
                  onInputChanged: (PhoneNumber value) {},
                ),
              ),
              SpaceHelper.verticalSpace60,
              SpaceHelper.verticalSpace30,
              InkWell(
                onTap: () {
                  _authController.otpSubmitted.value = true;
                  _authController.startOtpCountdown();
                },
                child: Container(
                  width: 314.w,
                  height: 35.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: ColorHelper.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Get OTP',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOTPVerification(BuildContext context) {
    return Positioned(
      bottom: 260.h,
      child: SizedBox(
        height: 350.h,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'OTP Verification',
                style: StyleHelper.headline1,
              ),
              SpaceHelper.verticalSpace10,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Enter the code from the sms we sent to ',
                        style: StyleHelper.agreeText),
                    TextSpan(
                        text: '${_authController.phoneNumbercontroller.text} ',
                        style: StyleHelper.agreeTextBold),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              SpaceHelper.verticalSpace30,
              SpaceHelper.verticalSpace10,
              SizedBox(
                  height: 100.h,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Obx(() => Text(_authController.otpTime.value,
                          style: StyleHelper.blueTextBold)),
                      SpaceHelper.verticalSpace10,
                      Pinput(
                        defaultPinTheme: PinTheme(
                          width: 56,
                          height: 56,
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: ColorHelper.primaryColor,
                              fontWeight: FontWeight.w600),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorHelper.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SpaceHelper.verticalSpace10,
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "Don't receive the ",
                                style: StyleHelper.agreeText),
                            TextSpan(
                                text: 'OTP? ', style: StyleHelper.blueTextBold),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  )),
              SpaceHelper.verticalSpace60,
              SpaceHelper.verticalSpace10,
              InkWell(
                onTap: () {
                  Get.offAll(() => const HomeScreen(), transition: Transition.rightToLeft);
                },
                child: Container(
                  width: 314.w,
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
                      'Submit',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
