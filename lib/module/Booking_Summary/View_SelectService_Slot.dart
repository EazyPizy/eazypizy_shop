import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../theme/theme.dart';
import '../../widgets/eazy_widgets.dart';

class SelectServiceSlotView extends StatelessWidget {
  const SelectServiceSlotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Slot',
        ),
      ),
      body: GetBuilder(
        // init: BookingController(),
        builder: (controller) {
          return SingleChildScrollView(
            padding: Space.scaffoldPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EasyContainer(
                  padding: 10,
                  color: EazyColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today',
                        style: Get.textTheme.titleMedium,
                      ),
                      Text(
                        DateFormat('EEEE d MMMM').format(DateTime.now()),
                        style: Get.textTheme.headlineMedium,
                      ),
                      EasyContainer(
                        //width: 60,
                        height: 100.h,
                        // showBorder: true,
                        color: EazyColors.white,
                        child: DateSelector(
                          startDate: DateTime.now(),
                          // onSelectedDate: controller.setDate,
                          onSelectedDate: (value) {},
                          // selectedDate: controller.bookingDate,
                          selectedDate: DateTime.now(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    height: 20.h,
                    child: Text(
                      'Select Time',
                      style: Get.textTheme.titleLarge,
                    ),
                  ),
                ),
                EasyContainer(
                  color: EazyColors.white,
                  //height: 250.h,
                  child: TimeSelector(
                    // selectedDate: controller.bookingDate,
                    selectedDate: DateTime.now(),
                    // onSelectTime: controller.setTime,
                    onSelectTime: (value) {},
                    // selectedTime: controller.bookingTime,
                    selectedTime: DateTime.now(),
                  ),
                )
              ],
            ),
          );
        },
      ),
      // bottomNavigationBar: ViewCartBottomNavigation(
      //   // total: controller.getTotal(),

      //   buttonWidget: EazyButtons.flexWidthElevatedButton(
      //     'Next',
      //     () {
      //       final controller = Get.find<BookingController>();
      //       if (controller.bookingDate == null ||
      //           controller.bookingTime == null) {
      //         EazySnackBar.buildErronSnackbar(
      //           'Date and Time Missing',
      //           "Damm sure you won't like someone showing up randomly!",
      //         );
      //         return;
      //       }
      //       Get.to(const BookingSummary());
      //     },
      //     40,
      //   ),
      // ),
    );
  }
}

class TimeSelector extends StatelessWidget {
  const TimeSelector({
    super.key,
    // required this.times,
    required this.onSelectTime,
    this.selectedTime,
    this.selectedDate,
  });

  // final List<DateTime> times;
  final void Function(DateTime value) onSelectTime;
  final DateTime? selectedTime;
  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final localTime = DateTime.now().toLocal();
    var hourLenth = 16;
    var initialHour = 6;
    print(selectedDate?.day);
    print(localTime.day);

    if (selectedDate?.day == localTime.day && localTime.hour > 6) {
      initialHour = localTime.hour + 2;
      hourLenth = 22 - initialHour;
    }
    print(hourLenth);
    final times = List.generate(
      hourLenth,
      (index) => DateTime(
        localTime.year,
        localTime.month,
        1,
        index + initialHour,
      ),
    );

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: hourLenth,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 1.1,
        // number of columns in the grid
        mainAxisSpacing: 2,
        // spacing between rows
        crossAxisSpacing: 2, // spacing between columns
      ),
      itemBuilder: (context, i) {
        // final time = DateTime.now()
        //     .add(Duration(hours: i + 1))
        //     .toUtc()
        //     .add(const Duration(hours: 4, minutes: 30));
        final time = times[i];
        //     .add(Duration(hours: i + 1))
        //     .toUtc()
        //     .add(const Duration(hours: 4, minutes: 30));
        final isSelected = time.hour == selectedTime?.hour &&
            time.minute == selectedTime?.minute;

        return Padding(
          padding: const EdgeInsets.all(8),
          child: EasyContainer(
            height: 20,
            width: 50,
            showBorder: true,
            onTap: () => onSelectTime(time),
            padding: 8,
            borderRadius: 6,
            color: isSelected ? EazyColors.primary : EazyColors.white,
            borderColor: EazyColors.primary,
            // color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('jm').format(time),
                  style: Get.textTheme.titleMedium?.copyWith(
                    color: isSelected ? EazyColors.white : EazyColors.black,
                  ),
                ),
                // Text(
                //   'PM',
                //   style: Get.textTheme.titleSmall,
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}

class DateSelector extends StatelessWidget {
  const DateSelector({
    super.key,
    //required this.dates,
    required this.startDate,
    required this.onSelectedDate,
    this.selectedDate,
  });

  final DateTime startDate;
  final DateTime? selectedDate;

  //final List<DateTime> dates;
  final void Function(DateTime value) onSelectedDate;

  @override
  Widget build(BuildContext context) {
    String getMonthName(int month) {
      switch (month) {
        case 1:
          return 'January';
        case 2:
          return 'February';
        case 3:
          return 'March';
        case 4:
          return 'April';
        case 5:
          return 'May';
        case 6:
          return 'June';
        case 7:
          return 'July';
        case 8:
          return 'August';
        case 9:
          return 'September';
        case 10:
          return 'October';
        case 11:
          return 'November';
        case 12:
          return 'December';
        default:
          return '';
      }
    }

    final weekDates = <DateTime>[];

    for (var i = 0; i < 7; i++) {
      if (i == 0 && DateTime.now().toLocal().hour >= 20) {
        continue;
      }
      weekDates.add(startDate.add(Duration(days: i)));
    }
    // var selectedDate = DateTime.now();
    // bool isSelected = false;
    print(weekDates.length);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: weekDates.length,
      itemBuilder: (context, i) {
        final isSelected = weekDates[i].day == selectedDate?.day &&
            weekDates[i].month == selectedDate?.month;

        return Padding(
          padding: const EdgeInsets.all(8),
          child: EasyContainer(
            showBorder: true,
            width: 50,
            onTap: () {
              onSelectedDate(weekDates[i]);
              print('selected date ${weekDates[i]}');
            },
            height: 50.h,
            padding: 8,
            color: isSelected ? EazyColors.primary : EazyColors.white,
            borderColor: EazyColors.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weekDates[i].day.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: isSelected ? EazyColors.white : EazyColors.black,
                  ),
                ),
                Text(
                  getMonthName(weekDates[i].month).substring(0, 3),
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? EazyColors.white : EazyColors.black,
                  ),
                ),
              ],
            ),
          ),
          //  ),
        );
      },
    );
  }
}
