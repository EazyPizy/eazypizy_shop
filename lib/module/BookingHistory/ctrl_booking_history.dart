import 'package:get/get.dart';
import 'package:logger/logger.dart';

// class BookingHistoryController extends GetxController {
//   final Logger _log = getLogger('BookingHistoryController');
//   final List<BookingDetailModel> bookings = [];
//   bool loadingBookings = false;

//   VoidFuture getBookings() async {
//     final customer = CustomerService.instance.customer;
//     loadingBookings = true;
//     update();
//     _log.v('Getting bookings...');
//     try {
//       final data = await FirebaseFirestore.instance
//           .collection(FirestoreCollections.bookings)
//           .where('customer_id', isEqualTo: customer!.id)
//           .orderBy('booking_date', descending: true)
//           .get();
//       bookings.clear();
//       // _log.i(data.docs[0].data()['products']);
//       if (data.docs.isNotEmpty) {
//         for (final element in data.docs) {
//           bookings.add(BookingDetailModel.fromMap(element.data(), element.id));
//         }
//       }
//     } catch (e) {
//       _log.e(e);

//       EazySnackBar.buildErronSnackbar(
//         'Failed',
//         'Failed to fetch bookings. Please check your connection and try again',
//       );
//     } finally {
//       loadingBookings = false;
//       update();
//     }
//   }

//   String convertBookingStatus(int status) {
//     switch (status) {
//       case 0:
//         return 'Booking Pending';
//       case 1:
//         return 'Scheduled';
//       case 2:
//         return 'Ongoing';
//       case 3:
//         return 'Completed';
//       case 4:
//         return 'Canceled';
//       default:
//         return 'Pending';
//     }
//   }

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     getBookings();
//   }
// }
