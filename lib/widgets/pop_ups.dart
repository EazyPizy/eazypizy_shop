import 'package:eazypizy_shop/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

Future<dynamic> infoPopUp(
  String msg, {
  String? title,
  String? confirmBtnText,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
}) async =>
    QuickAlert.show(
      context: Get.context!,
      type: QuickAlertType.info,
      confirmBtnColor: Colors.green,
      showCancelBtn: onCancel != null,
      confirmBtnText: confirmBtnText ?? 'Clear Cart',

      text: msg,
      title: title ?? 'Clear Cart',
      confirmBtnTextStyle: const TextStyle(
        color: EazyColors.white,
      ),

      // Get.textTheme.bodyMedium?.copyWith(color: Colors.white),
      onConfirmBtnTap: onConfirm,
      cancelBtnTextStyle:
          Get.textTheme.bodyMedium?.copyWith(color: Colors.redAccent),
      onCancelBtnTap: onCancel,
    );

Future<dynamic> warningPopUp(
  String msg, {
  String? title,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
}) async =>
    QuickAlert.show(
      context: Get.context!,
      type: QuickAlertType.warning,
      confirmBtnColor: EazyColors.primary,
      showCancelBtn: onCancel != null,
      confirmBtnText: 'Confirm',
      barrierDismissible: false,
      text: msg,
      title: title,
      confirmBtnTextStyle: const TextStyle(
        color: EazyColors.white,
      ),
      onConfirmBtnTap: onConfirm,
      cancelBtnTextStyle: Get.textTheme.bodyMedium?.copyWith(color: Colors.red),
      onCancelBtnTap: onCancel,
    );

Future<dynamic> successPopUp(
  String msg, {
  String? title,
  VoidCallback? onConfirm,
  String? confirmBtnText,
  bool? dismissible,
}) async =>
    QuickAlert.show(
      context: Get.context!,
      barrierDismissible: dismissible ?? true,
      type: QuickAlertType.success,
      confirmBtnColor: EazyColors.primary,
      text: msg,
      title: title,
      confirmBtnText: confirmBtnText ?? 'Okay',
      confirmBtnTextStyle:
          Get.textTheme.bodyMedium?.copyWith(color: Colors.white),
      onConfirmBtnTap: onConfirm,
    );

Future<dynamic> errorPopUp(
  String msg, {
  VoidCallback? onConfirm,
  String? text,
  String? title,
}) async =>
    QuickAlert.show(
      context: Get.context!,
      type: QuickAlertType.error,
      confirmBtnColor: EazyColors.secondary,
      text: msg,
      title: title,
      confirmBtnTextStyle:
          Get.textTheme.bodyMedium?.copyWith(color: Colors.white),
      confirmBtnText: text ?? 'Okay',
      onConfirmBtnTap: onConfirm,
    );
