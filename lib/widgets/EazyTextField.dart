import 'package:eazypizy_shop/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable

class EazyTextField {
  EazyTextField._();

  static SizedBox stringTextField(
    String validateMsg,
    TextInputAction? inputAction,
    TextInputType? keyBoardType, {
    int? length,
    required String hintText,
    required TextEditingController controller,
  }) {
    return SizedBox(
      height: 45.h,
      child: TextFormField(
        maxLength: length,
        buildCounter: (
          context, {
          required currentLength,
          required isFocused,
          maxLength,
        }) {
          return null;
        },
        controller: controller,
        textInputAction: inputAction,
        keyboardType: keyBoardType,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: EazyColors.primary),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: EazyColors.blackShade,
            ),
          ),
        ),
        validator: (val) => (val!.isEmpty) ? validateMsg : null,
      ),
    );
  }

  static SizedBox optionalTextField({
    required String hintText,
    TextEditingController? controller,
  }) {
    return SizedBox(
      height: 45.h,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: EazyColors.primary),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: EazyColors.blackShade,
            ),
          ),
        ),
      ),
    );
  }

  static SizedBox numberTextField(
    String validateMsg,
    int length, {
    required String hintText,
  }) {
    return SizedBox(
      height: 45.h,
      child: TextFormField(
        maxLength: length,
        buildCounter: (
          context, {
          required currentLength,
          required isFocused,
          maxLength,
        }) {
          return null;
        },
        validator: (val) =>
            (val!.isEmpty || val.length < length) ? validateMsg : null,
        keyboardType: TextInputType.number,
        // controller: controller.mobileNumberController,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: EazyColors.primary),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: EazyColors.blackShade,
            ),
          ),
        ),
        //   validator: (val) => (val!.isEmpty) ? validateMsg : null,
      ),
    );
  }
}
