import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../../../widgets/eazy_widgets.dart';

class BookingHistoryCard extends StatelessWidget {
  const BookingHistoryCard({
    super.key,
  });

  // final BookingDetailModel booking;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<BookingHistoryController>();
    return EasyContainer(
      borderRadius: 12,
      padding: 10,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Order # ',
                style: Get.textTheme.titleSmall,
              ),
            ],
          ),
          ListTile(
            onTap: () {
              // Get.to(() => const BookingHistoryDetails(), arguments: booking);
            },
            minLeadingWidth: 0,
            leading: EasyContainer(
              showBorder: true,
              borderRadius: 6,
              color: Colors.white,
              borderColor: Colors.blueAccent,
              height: 55.h,
              width: 55.w,
              child: const EazyNetworkImage(
                url:
                    'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29',
              ),
            ),
            title: Text(
              // booking.eazymen_name ?? '',
              'eazymen_name',
              style: Get.textTheme.titleLarge,
            ),
            subtitle: Text(
              // '₹${booking.payment_total}',
              '₹payment_total',
              style: Get.textTheme.titleMedium
                  ?.copyWith(color: EazyColors.lightBlack),
            ),
            // isThreeLine: trues,
            trailing: const Icon(
              Icons.chevron_right,
              color: EazyColors.primary,
              size: 28,
            ),
          ),
          const Divider(
            // thickness: 1,
            color: EazyColors.barBg,
            // indent: 10,
            // endIndent: 10,
          ),
          Row(
            children: [
              Text(
                // 'Date - ${DateFormat('dd-MM-yyyy').format(DateTime.parse(booking.booking_date!))}',
                'Date -  ',
                style: Get.textTheme.titleSmall,
              ),
              const Spacer(),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  // bookingStatus(booking.booking_status ?? 0),
                  bookingStatus(0),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget bookingStatus(
    int status,
  ) {
    switch (status) {
      case 0:
        return Row(
          children: [
            const Icon(
              Icons.circle,
              color: Colors.orange,
              size: 10,
            ),
            Space.horizontal(4),
            Text('Booking Request', style: Get.textTheme.titleMedium),
          ],
        );
      case 1:
        return Row(
          children: [
            const Icon(
              Icons.circle,
              color: Colors.yellow,
              size: 10,
            ),
            Space.horizontal(10),
            Text('Pending', style: Get.textTheme.titleMedium)
          ],
        );
      case 2:
        return Row(
          children: [
            const Icon(
              Icons.circle,
              color: Colors.blue,
              size: 10,
            ),
            Space.horizontal(10),
            Text(
              'Working',
              style: Get.textTheme.titleMedium,
            ),
          ],
        );
      case 3:
        return Row(
          children: [
            const Icon(
              Icons.circle,
              color: Colors.green,
              size: 10,
            ),
            Space.horizontal(10),
            Text('Done', style: Get.textTheme.titleMedium),
          ],
        );
      case 4:
        return Row(
          children: [
            const Icon(
              Icons.circle,
              color: Colors.red,
              size: 10,
            ),
            Space.horizontal(10),
            Text('Canceled', style: Get.textTheme.titleMedium),
          ],
        );
      default:
        return Row(
          children: [
            const Icon(
              Icons.circle,
              color: Colors.yellow,
              size: 10,
            ),
            Space.horizontal(10),
            Text('Pending', style: Get.textTheme.titleMedium),
          ],
        );
    }
  }
}
