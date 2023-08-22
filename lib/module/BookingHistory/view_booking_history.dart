import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/eazy_widgets.dart';
import 'Components/List_Booking_History.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({super.key});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

List<String> chipText = ['All', 'yesterday', 'This Week', 'This Month'];
bool isloading = false;

class _BookingHistoryState extends State<BookingHistory> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // if (Get.previousRoute == Routes.navigationScreen) {
        //   // Get.offAllNamed(Routes.navigationScreen);
        //   return Future.value(true);
        // }
        // Get.offAllNamed(Routes.navigationScreen);
        // // return;

        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Bookings',
          ),
        ),
        body: GetBuilder(
          // init: BookingHistoryController(),
          builder: (controller) {
            // if (controller.loadingBookings) {
            if (false) {
              return const Center(
                child: EazyLoadingWidget(),
              );
            }
            // if (controller.bookings.isEmpty) {
            if (false) {
              return RefreshIndicator(
                onRefresh: () {
                  return Future.value();
                  // controller.getBookings();
                },
                child: const Center(
                  child: Text('Empty Bookings'),
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () {
                return Future.value();
                // controller.getBookings();
              },
              // child: ListBookingHistory(controller.bookings),
              child: ListBookingHistory([]),
            );
          },
        ),
      ),
    );
  }

  Widget customChips(String title) {
    return Chip(
      elevation: 1,
      padding: const EdgeInsets.all(8),
      backgroundColor: Colors.greenAccent[100],
      label: Text(
        title,
        style: const TextStyle(fontSize: 10),
      ), //Text
    );
  }

  Future bookingDetails(String bookingID) {
    return Get.bottomSheet(
      SizedBox(
        width: 500,
        height: MediaQuery.of(context).size.height * 0.90,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Customer Details'),
              ListTile(
                title: const Text('Amit Bairwa'),
                subtitle: const Text('9023499063'),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.whatshot),
                ),
              ),
              const Text('Customer Address'),
              ListTile(
                title: const Text('House No C-31'),
                subtitle: const Text('Ashol Vihar'),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.whatshot_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
      elevation: 2,
      enableDrag: true,
      ignoreSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  Widget orderCard(String image, String name, double price, int quantity) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            height: 60,
            width: 60,
            child: image != null
                ? Image.network(image)
                : Container(
                    color: Colors.green,
                    height: 20,
                    width: 20,
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              const Text('Size'),
              Text(' Quantity $quantity')
            ],
          ),
        ),
        const Spacer(),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(price.toString()),
        )
      ],
    );
  }

  SizedBox orderOverView(String bookingID, String customerName) {
    return SizedBox(
      height: 150,
      child: Card(
        elevation: 1,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                bookingDetails(bookingID);
              },
              child: Column(
                children: [
                  ListTile(
                    title: (customerName != null)
                        ? Text(customerName)
                        : Container(),
                    subtitle: const Text('Price'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: const [
                        Icon(Icons.done),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Booking Status'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
