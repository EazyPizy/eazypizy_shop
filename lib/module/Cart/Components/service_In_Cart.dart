import 'package:eazypizy_shop/module/Cart/ctrl_cart.dart';
import 'package:eazypizy_shop/theme/app_colors.dart';
import 'package:eazypizy_shop/theme/eazy_spaces.dart';
import 'package:eazypizy_shop/widgets/Count.dart';
import 'package:eazypizy_shop/widgets/easy_container.dart';
import 'package:eazypizy_shop/widgets/eazy_networkimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServiceInCart extends StatelessWidget {
  const ServiceInCart({
    super.key,
    // required this.cart,
  });

  // final BookingCartModel cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EasyContainer(
          customBorderRadius: BorderRadius.only(
            topRight: Radius.circular(15.r),
            topLeft: Radius.circular(15.r),
          ),
          color: EazyColors.primary.withOpacity(.1),
          padding: 12,

          //height: 50.h,
          borderRadius: 0.r,
          //  color: Colors.blueAccent.withOpacity(0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Professional',
                style: Get.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  letterSpacing: .3,
                ),
              ),
              Space.vertical(10.h),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                // shape: RoundedRectangleBorder(
                //   side: BorderSide(color: Colors.grey, width: 1),
                //   borderRadius: BorderRadius.circular(5),
                // ),
                //tileColor: EazyColors.white,
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                leading: EasyContainer(
                  //showBorder: true,
                  borderRadius: 6,
                  color: Colors.white,
                  borderColor: Colors.blueAccent,
                  height: 60.h,
                  width: 60.w,
                  child: const EazyNetworkImage(
                    url:
                        'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29',
                    // fit: BoxFit.fill,
                  ),
                ),
                title: Text(
                  'firstName',
                  // cart.eazyMen.personalDetail?.firstName ?? '',
                  style: Get.textTheme.titleLarge,
                ),
                // subtitle: Text(
                //   '4.5 Rating',
                //   style: Get.textTheme.titleSmall,
                // ),
                // trailing: const Icon(Icons.chat_outlined),
              ),
            ],
          ),
        ),
        EasyContainer(
          customBorderRadius: BorderRadius.only(
            topRight: Radius.circular(0.r),
            topLeft: Radius.circular(0.r),
          ),
          borderRadius: 10,
          color: EazyColors.white,
          padding: 10,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => CartProductItem(
                // product: cart.products[index],
                ),
            separatorBuilder: (context, index) => Space.vertical(16),
            // itemCount: cart.products.length,
            itemCount: 4,
            padding: const EdgeInsets.all(8),
          ),
        ),
      ],
    );
  }
}

class CartProductItem extends StatelessWidget {
  const CartProductItem({
    super.key,
    // required this.product,
  });

  // final BookingProductModel product;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EasyContainer(
              showBorder: true,
              borderColor: EazyColors.borderColors,
              height: 50.h,
              width: 50.w,
              child: Image.network(
                // product.serviceProdImage,
                'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29',
                fit: BoxFit.fill,
              ),
            ),
            Space.horizontal(10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ProductName',
                    // product.serviceProductName,
                    style: Get.textTheme.titleMedium,
                    // softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // '\u{20B9} ${controller.getPrice(product.serviceProductId).toString()}',
                        '\u{20B9} 123', //${controller.cartItem!.products.firstWhere((element) => element.serviceProductId == product.serviceProductId).price}',
                        style: Get.textTheme.titleMedium,
                      ),
                      Space.horizontal(10.w),
                      Text(
                        '',
                        // '\u{20B9} ${controller.cartItem!.products.firstWhere((element) => element.serviceProductId == product.serviceProductId).price}',
                        // '\u{20B9} ${controller.getPrice(product.serviceProductId).toString()}',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12.sp,
                          color: EazyColors.gray100,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // const Spacer(),
            Space.horizontal(8.w),
            if (Get.currentRoute == '/BookingSummary')
              Text(
                'Qty :1', // ${controller.getQuantity(product.serviceProductId)}',
              )
            else
              SizedBox(
                width: 80.w,
                child: CustomStepper(
                  lowerLimit: 0,
                  stepValue: 1,
                  iconSize: 24,
                  // value: controller.getQuantity(product.serviceProductId),
                  value: 1,
                  onChange: (p0) {
                    // controller.updateProductQuantity(
                    //   product,
                    //   p0,
                    // );
                  },
                ),
              ),
            Space.vertical(8.h),
          ],
        );
      },
    );
  }
}
