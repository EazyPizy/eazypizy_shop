import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';
import '../../widgets/eazy_widgets.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      // init: SplashController(),
      builder: (_) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Space.vertical(8),
                Image.asset('assets/eazypizyLogo.png'),
                const EazyLoadingWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
