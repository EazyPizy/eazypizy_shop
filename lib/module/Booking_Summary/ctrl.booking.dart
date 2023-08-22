import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../core/logger.dart';

// class BookingController extends GetxController {
//   // BookingController();
//   final Logger _log = getLogger('Booking Controller');
//   final customer = CustomerService.instance.customer!;

//   bool loading = false;

//   DateTime? bookingDate = DateTime.now().toLocal().hour >= 20
//       ? DateTime.now().copyWith(day: DateTime.now().day + 1)
//       : DateTime.now().toLocal();
//   DateTime? bookingTime;
//   // EazyMenCartModel? cartItem;

//   // EazyMenCartModel? cartItem;

//   void setDate(DateTime date) {
//     bookingDate = date;
//     update();
//   }

//   void setTime(DateTime time) {
//     bookingTime = time;
//     update();
//   }

//   late BookingCartModel _cartData;

//   bool? isSelected;

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     _cartData = Get.arguments as BookingCartModel;
//   }

//   BookingCartModel get cartData => _cartData;

//   String get scheduledDateTime =>
//       '${DateFormat('EEEE, d MMMM').format(bookingDate!)} - ${DateFormat('hh:mm a').format(bookingTime!)}';

//   Future<void> confirmBooking() async {
//     loading = true;
//     update();
//     final booking = {
//       'products': [
//         ..._cartData.products.map((e) => e.toMap()),
//       ],
//       'eazymen_id': _cartData.eazyMen.eazyManUid,
//       'eazymen_name': _cartData.eazyMen.personalDetail!.firstName,
//       'eazymen_location': _cartData.eazyMen.personalDetail!.city,
//       'eazymen_fcm_token': _cartData.eazyMen.fcmToken,
//       'payment_tax': _cartData.tax,
//       'payment_items_total': _cartData.itemTotal,
//       'payment_discount': 0,
//       'payment_total': _cartData.grandTotal,
//       'customer_id': customer.id,
//       'customer_name': customer.name,
//       'customer_address': customer.address!.toMap(),
//       'customer_phone': customer.phoneNumber,
//       'customer_fcm_token': customer.fcmToken,
//       'booking_date': DateTime.now().toString(),
//       'booking_scheduled_date': bookingDate.toString(),
//       'booking_scheduled_time': bookingTime.toString(),
//       'booking_status': 0,
//       'canceled_by': null,
//       'cancel_reason': null,
//       'service_start_code': int.parse(
//         '${Random().nextInt(10)}${Random().nextInt(10)}${Random().nextInt(10)}${Random().nextInt(10)}',
//       ),
//       'service_end_code': int.parse(
//         '${Random().nextInt(10)}${Random().nextInt(10)}${Random().nextInt(10)}${Random().nextInt(10)}',
//       ),
//     };
//     try {
//       _log
//         ..v('confirming booking...')
//         ..i(jsonEncode(booking));
//       print(jsonEncode(booking));
//       final ref =
//           await FirebaseFirestore.instance.collection('Bookings').add(booking);
//       await CartService.instance.clearCart();
//       _log
//         ..v('Booking done!')
//         ..i(ref.id);
//       await Get.to(const ViewBookingDone());
//       //successPopUp('Booking Done Sucessfully');
//     } catch (e) {
//       _log.e(e);
//       EazySnackBar.buildErronSnackbar('Something went wrong', '$e');
//     } finally {
//       loading = false;
//       update();
//     }
//   }
// }
