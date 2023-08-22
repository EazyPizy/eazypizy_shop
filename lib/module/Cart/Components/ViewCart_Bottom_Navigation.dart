import 'package:eazypizy_shop/theme/app_colors.dart';
import 'package:eazypizy_shop/theme/eazy_spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ViewCartBottomNavigation extends StatelessWidget {
  const ViewCartBottomNavigation({
    required this.buttonWidget,
    super.key,
    this.items,
    this.total,
  });

  final Widget buttonWidget;
  final int? items;
  final double? total;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.2.w,
          ),
        ),
        color: EazyColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Space.horizontal(10.w),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (items != null)
                  Text(
                    'Cart Items: $items',
                    style: Get.textTheme.titleMedium,
                  ),
                if (total != null)
                  Text(
                    'Total: \u{20B9}$total',
                    style: Get.textTheme.titleMedium,
                  ),
              ],
            ),
            const Spacer(),
            buttonWidget,
          ],
        ),
      ),
    );
  }
}
