import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';
import '../../widgets/eazy_widgets.dart';

class ViewBookingDone extends StatefulWidget {
  const ViewBookingDone({super.key});

  @override
  State<ViewBookingDone> createState() => _ViewBookingDoneState();
}

class _ViewBookingDoneState extends State<ViewBookingDone> {
  late ConfettiController _controllerCenter;
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;
  late ConfettiController _controllerTopCenter;
  late ConfettiController _controllerBottomCenter;

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenter.play();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    _controllerTopCenter.dispose();
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (var step = 0.0; step < fullAngle; step += degreesPerStep) {
      path
        ..lineTo(
          halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step),
        )
        ..lineTo(
          halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep),
        );
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  const Icon(
                    Icons.verified_rounded,
                    size: 150,
                    color: Colors.lightGreen,
                  ),
                  ConfettiWidget(
                    confettiController: _controllerCenter,
                    blastDirectionality: BlastDirectionality.explosive,
                    // don't specify a direction, blast randomly
                    shouldLoop: true,
                    // start again as soon as the animation is finished
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple
                    ],
                    // manually specify the colors to be used
                    createParticlePath: drawStar, // define a custom shape/path.
                  ),
                ],
              ),

              const Text(
                'Booking Successfull',
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.black),
              ),

              // Align(
              //   alignment: Alignment.center,
              //   child: TextButton(
              //       onPressed: () {
              //         _controllerCenter.play();
              //       },
              //       child: _display('blast\nstars')),
              // ),
              Row(
                children: [
                  Expanded(
                    child: EazyButtons.flexWidthElevatedButton2(
                      'Track Order',
                      () {
                        // Get.toNamed(
                        //   Routes.bookingHistory,
                        //   // predicate: (route) => route.isFirst,
                        // );
                      },
                      40,
                    ),
                  ),
                  Space.horizontal(10.w),
                  Expanded(
                    child: EazyButtons.flexWidthElevatedButton(
                      'Shop Again',
                      () {
                        // Get.offAllNamed(
                        //   Routes.navigationScreen,
                        //   // predicate: (route) => route.isFirst,
                        // );
                      },
                      40,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Text _display(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}
