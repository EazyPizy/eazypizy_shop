import 'package:eazypizy_shop/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EazyButtons {
  EazyButtons._();

  static ElevatedButton fullWidthElevatedButton(
      String title, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: EazyColors.primary,
        //background color of button
        // side: BorderSide(width:3, color:Colors.white), //border width and color
        elevation: 3,
        //elevation of button
        shape: RoundedRectangleBorder(
          //to set border radius to button
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
        ), //content padding inside button
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  static ElevatedButton fullWidthShareButton(
      String title, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: Colors.green,
        //background color of button
        // side: BorderSide(width:3, color:Colors.white), //border width and color
        elevation: 3,
        //elevation of button
        shape: RoundedRectangleBorder(
          //to set border radius to button
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
        ), //content padding inside button
      ),
      child: Text(
        title,
        style: Get.textTheme.titleMedium,
      ),
    );
  }

  static ElevatedButton flexWidthElevatedButton(
      String title, VoidCallback onPressed, double edgeInsets) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: EazyColors.primary,
        //background color of button
        // side: BorderSide(width:3, color:Colors.white), //border width and color
        // elevation: 1,
        //elevation of button
        side: BorderSide(color: EazyColors.primary),
        shape: RoundedRectangleBorder(
          //to set border radius to button
          borderRadius: BorderRadius.circular(6),
        ),
        padding: EdgeInsets.only(
          left: edgeInsets,
          right: edgeInsets,
        ), //content padding inside button
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'assets/fonts/Signika-Regular.ttf',
        ),
      ),
    );
  }

  static ElevatedButton flexWidthElevatedButton2(
      String title, VoidCallback onPressed, double edgeInsets) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: EazyColors.white,

        //background color of button
        // side: BorderSide(width:3, color:Colors.white), //border width and color
        // elevation: 1,
        side: BorderSide(color: EazyColors.primary), //elevation of button
        shape: RoundedRectangleBorder(
          //to set border radius to button
          borderRadius: BorderRadius.circular(
            6,
          ),
        ),
        padding: EdgeInsets.only(
          left: edgeInsets,
          right: edgeInsets,
        ), //content padding inside button
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: EazyColors.primary,
          fontSize: 12,
          fontFamily: 'assets/fonts/Signika-Regular.ttf',
        ),
      ),
    );
  }

  static TextButton primaryTextButton(String lable, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        foregroundColor: EazyColors.primary,
        minimumSize: const Size(50, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
      ),
      child: Text(
        lable,
      ),
    );
  }
}

// This is any page in your project

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       //        Always create body with Builder method so you can
//       //        get exact context to pass
//       body: Builder(
//         builder: (context) =>
//             Center(
//               child: ElevatedButton(
//                 onPressed: (){
//                   CustomWidgets.buildErrorSnackbar(context,"Your message here");
//                 },
//                 child: Text('Display SnackBar'),
//               ),
//             ),
//       ),
//     );
//   }
// }
