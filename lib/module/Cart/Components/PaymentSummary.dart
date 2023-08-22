import 'package:eazypizy_shop/theme/app_colors.dart';
import 'package:eazypizy_shop/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({
    super.key,
    required this.total,
    required this.tax,
    required this.grandTotal,
  });

  final String total;
  final String tax;
  final String grandTotal;

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      //margin: 10,
      borderRadius: 10,
      color: EazyColors.white,
      padding: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment Summary', style: Get.textTheme.titleMedium),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Services total', style: Get.textTheme.titleMedium),
              Text(
                '₹$total',
                style: Get.textTheme.titleMedium,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Tax',
                  children: [
                    TextSpan(
                      text: ' (18% GST)',
                      style: Get.textTheme.titleMedium!.copyWith(
                        color: EazyColors.black.withOpacity(.5),
                      ),
                    ),
                  ],
                ),
                style: Get.textTheme.titleMedium,
              ),
              // Text.rich('Tax', style: Get.textTheme.titleMedium),
              Text(
                '₹$tax',
                style: Get.textTheme.titleMedium,
              ),
            ],
          ),
          const Divider(),
          // const SizedBox(
          //   height: 30,
          // ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Grand Total', style: Get.textTheme.titleMedium),
              Text(
                '₹$grandTotal',
                style: Get.textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
