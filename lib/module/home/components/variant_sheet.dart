import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../../../widgets/eazy_widgets.dart';

void variantSheet() => Get.bottomSheet(
      Container(
        color: EazyColors.background,
        height: 320.h,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Space.vertical(8.h),
            // Bar(width: 60.w, height: 4, color: Ea.barColor),
            Space.vertical(16.h),
            Text('Available Quantities'),
            Space.vertical(16.h),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (context, index) => Space.vertical(16.h),
                itemBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: EazyButtons.primaryTextButton(
                        '${150} ${'gm'}  -  ₹${123}',
                        () {},
                      ),
                    ),
                    Space.horizontal(16.w),
                    Expanded(
                      child: CustomStepper(
                        lowerLimit: 0,
                        stepValue: 1,
                        iconSize: 20,
                        value: 2,
                        onChange: (p0) {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
