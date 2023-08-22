import 'package:eazypizy_shop/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EazyLoadingWidget extends StatelessWidget {
  const EazyLoadingWidget({super.key, this.color = EazyColors.primary});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
    );
  }
}
