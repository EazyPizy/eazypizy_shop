import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      title: Text(
        'ProductName' ?? '',
        // style: Get.textTheme.titleMedium,
      ),
      subtitle: Row(
        children: [
          Text(
            'RetailPrice',
            // style: Get.textTheme.titleMedium,
          ),
          Space.horizontal(4),
          Text(
            'MRP',
            // style: Get.textTheme.titleMedium,
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
