import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class CartSubmitButton extends StatelessWidget {
  const CartSubmitButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: EazyColors.primary,
        //background color of button
        // side: BorderSide(width:3, color:Colors.white), //border width and color
        elevation: 1,
        //elevation of button
        shape: RoundedRectangleBorder(
          //to set border radius to button
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ), //content padding inside button
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontFamily: 'assets/fonts/Signika-Light.ttf',
        ),
      ),
    );
  }
}
