import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/mdl.booking.detail.dart';
import '../../../theme/eazy_spaces.dart';
import 'BookingHistoryCard.dart';

class ListBookingHistory extends StatelessWidget {
  const ListBookingHistory(this.bookings, {super.key});
  final List<BookingDetailModel> bookings;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      itemCount: bookings.length,
      itemBuilder: (context, index) => BookingHistoryCard(
          // bookings[index],
          ),
      separatorBuilder: (BuildContext context, int index) =>
          Space.vertical(10.h),
    );
  }
}
