import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';
import '../../widgets/eazy_widgets.dart';
import '../Cart/Components/PaymentSummary.dart';
import '../Cart/Components/ViewCart_Bottom_Navigation.dart';
import '../Cart/Components/service_In_Cart.dart';

class ClassName extends GetxController {}

class BookingSummary extends StatelessWidget {
  const BookingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      // init: BookingController(),
      init: ClassName(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Booking Summary'),
          ),
          body: SingleChildScrollView(
            padding: Space.scaffoldPadding,
            child: Column(
              children: [
                // ServiceInCart(cart: controller.cartData),
                ServiceInCart(),
                Space.vertical(10.h),
                EasyContainer(
                  child: ListTile(
                    tileColor: EazyColors.white,
                    minLeadingWidth: 8,
                    leading: const Icon(
                      Icons.home,
                      color: EazyColors.primary,
                      size: 25,
                    ),
                    title: Text(
                      // controller.customer.address!.toString(),
                      'address'!.toString(),
                      style: Get.textTheme.titleMedium,
                    ),
                  ),
                ),
                EasyContainer(
                  child: ListTile(
                    tileColor: EazyColors.white,
                    minLeadingWidth: 2,
                    leading: const Icon(
                      Icons.lock_clock,
                      color: EazyColors.primary,
                    ),
                    title: Text(
                      'scheduledDateTime',
                      style: Get.textTheme.titleMedium,
                    ),
                    trailing: TextButton(
                      onPressed: Get.back,
                      child: const Text(
                        'Change',
                        style: TextStyle(
                          color: EazyColors.primary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Space.vertical(10.h),
                PaymentSummary(
                  // grandTotal: controller.cartData.grandTotal.toString() ?? '',
                  grandTotal: '89',
                  // tax: controller.cartData.tax.toString() ?? '',
                  tax: '89',
                  // total: controller.cartData.itemTotal.toString() ?? '',
                  total: '89',
                ),
              ],
            ),
          ),
          bottomNavigationBar: ViewCartBottomNavigation(
            // buttonWidget: controller.loading
            buttonWidget: false
                ? const EazyLoadingWidget()
                : EazyButtons.flexWidthElevatedButton(
                    'Confirm Booking',
                    () {},
                    // Get.find<BookingController>().confirmBooking,
                    20,
                  ),
          ),
        );
      },
    );
  }
}
