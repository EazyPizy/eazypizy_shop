import 'package:eazypizy_shop/module/home/components/variant_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../../../widgets/eazy_widgets.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: EasyContainer(
        borderColor: EazyColors.borderColors,
        showBorder: true,
        color: EazyColors.white,
        height: 60,
        width: 60,
        child: Placeholder(),
        // child: Image.network(
        //   products[prodIndex].serviceProdImage!,
        //   errorBuilder: (context, error, stackTrace) => const Placeholder(),
        // ),
      ),
      // isThreeLine: true,
      title: Text(
        'ProductName' ?? '',
        // style: Get.textTheme.titleMedium,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'RetailPrice',
                style: TextStyle(color: EazyColors.black),
              ),
              Space.horizontal(4),
              Text(
                'MRP',
                style: TextStyle(color: EazyColors.black),
              ),
            ],
          ),
          InkWell(
            onTap: variantSheet,
            child: Text(
              'data',
              style: TextStyle(color: EazyColors.black),
            ),
          ),
        ],
      ),
      trailing: EazyButtons.primaryTextButton(
        'Add to cart',
        () {},
      ),
    );
  }
}
