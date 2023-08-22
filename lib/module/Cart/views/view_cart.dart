import 'package:eazypizy_shop/module/Cart/Components/PaymentSummary.dart';
import 'package:eazypizy_shop/module/Cart/Components/ViewCart_Bottom_Navigation.dart';
import 'package:eazypizy_shop/module/Cart/Components/service_In_Cart.dart';
import 'package:eazypizy_shop/module/Cart/ctrl_cart.dart';
import 'package:eazypizy_shop/module/Cart/views/view_emptycart.dart';
import 'package:eazypizy_shop/theme/eazy_spaces.dart';
import 'package:eazypizy_shop/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../widgets/eazy_widgets.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    // final customerService = CustomerService.instance;

    return GetBuilder(
      init: CartController(),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(true);
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text(
                'Your Cart',
              ),
              actions: const [],
            ),
            body: controller.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                // : controller.cartItem != null
                : true
                    ? SingleChildScrollView(
                        padding: Space.scaffoldPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //const selectedEazyman(),
                            // ServiceInCart(cart: controller.cartItem!),
                            ServiceInCart(),
                            Space.vertical(
                              8.h,
                            ),
                            PaymentSummary(
                              // grandTotal: controller.getGrandTotal().toString(),
                              grandTotal: '2',
                              // total: controller.getTotal().toString(),
                              total: '21',
                              // tax: controller.getTaxAmount().toString(),
                              tax: '12',
                            ),
                            Space.vertical(
                              8.h,
                            ),
                            // _applyCoupon(),
                            // Space.vertical(
                            //   16.h,
                            // ),
                          ],
                        ),
                      )
                    : const EmptyCartView(),
            // bottomNavigationBar: controller.cartItem != null
            bottomNavigationBar: true
                ? ViewCartBottomNavigation(
                    // total: controller.getTotal(),
                    buttonWidget: controller.submitButton(),
                    total: 3,
                  )
                : null,
          ),
        );
      },
    );
  }
}

// Widget customButtons(BuildContext context) {
//   return Expanded(
//     child: Padding(
//       padding: const EdgeInsets.all(8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           EazyButtons.flexWidthElevatedButton('Add Address', () {
//             _addDeliveryAddress(context);
//           }, 40),
//           ElevatedButton(
//             onPressed: () {
//               _addDeliveryAddress(context);
//             },
//             child: Text('Add Address', style: Get.textTheme.labelSmall),
//           ),
//           IconButton(
//             onPressed: () {
//               // enterMobileNumber(context);
//               CartService.instance.checkout();
//             },
//             icon: const Icon(Icons.chevron_right),
//           )
//         ],
//       ),
//     ),
//   );
// }

Widget yourSavings() {
  return EasyContainer(
    color: Colors.green,
    height: 50,
    child: Text('You are saving 50Rs', style: Get.textTheme.labelSmall),
  );
}

Widget? buildPinPut() {
  return const Pinput(
    onCompleted: print,
  );
}
