// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:logger/logger.dart';

import 'package:eazypizy_shop/module/Booking_Summary/BookingSummary.dart';
import 'package:eazypizy_shop/module/Cart/models/mdl_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/eazy_widgets.dart';

class CartController extends GetxController {
//   final _customerService = CustomerService.instance;
//   final _cartService = CartService.instance;
//   // final _apis = CartApis();
//   final Logger _log = getLogger('Cart Controller');

  BookingCartModel? cartItem;
  bool loading = false;

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     inItCart();
//   }

//   // void subscribeToAuthChange() {
//   //   _customerService.stateChange().listen((user) async {
//   //     if (user != null) {
//   //       loading = true;
//   //       update();
//   //       final localCart = _cartService.cart;
//   //       if (localCart != null) {
//   //         await _cartService.updateCart(localCart);
//   //       }
//   //       loading = false;
//   //       update();
//   //     }
//   //   });
//   // }

//   VoidFuture inItCart() async {
//     loading = true;
//     // if (!_customerService.isLoggedIn) {
//     //   subscribeToAuthChange();
//     // }
//     final cart = _cartService.cart;
//     if (cart == null) {
//       loading = false;
//       _log.v('Empty Cart');
//       update();
//       return;
//     }
//     await _getCartDetails(
//       cart,
//     );
//     loading = false;
//     update();
//   }

//   // Future<DynamicMap?> _getUserCart() async {
//   //   late final DynamicMap? cart;
//   //   try {
//   //     if (_customerService.isLoggedIn) {
//   //       final respone =
//   //           await _apis.getUserCart(FirebaseAuth.instance.currentUser!.uid);
//   //       cart = respone.data();
//   //     } else {
//   //       cart = await Get.find<DBService>().get(
//   //         'cartItem',
//   //       ) as DynamicMap?;
//   //     }
//   //     return cart;
//   //   } catch (e) {
//   //     _log.e(e);
//   //   }
//   //   return null;
//   // }

//   int getQuantity(String productId) {
//     return _cartService.cart!.productsId!
//         .firstWhere((element) => productId == element.id)
//         .quantity!;
//   }

//   double getPrice(String productId, EazyMenModel eazymen) {
//     return eazymen.subServiceProdcuts!
//         .firstWhere((element) => element.productId == productId)
//         .price
//         .toDouble();
//   }

//   VoidFuture updateProductQuantity(
//     BookingProductModel product,
//     int quantity,
//   ) async {
//     try {
//       final newCartItem = _cartService.cart!.copyWith();
//       if (quantity == 0) {
//         newCartItem.productsId!
//             .removeWhere((element) => element.id == product.serviceProductId);
//         if (newCartItem.productsId!.isEmpty) {
//           await _cartService.clearCart();
//           // await _getCartDetails(_cartService.cart!);
//           cartItem = null;
//           update();
//           return;
//         }
//         await _cartService.updateCart(
//           newCartItem,
//         );
//         await _getCartDetails(_cartService.cart!);
//         update();
//         return;
//       }
//       final newProduct =
//           CartProductModel(id: product.serviceProductId, quantity: quantity);

//       newCartItem.productsId!
//           .removeWhere((element) => element.id == product.serviceProductId);
//       newCartItem.productsId!.add(newProduct);
//       await _cartService.updateCart(
//         newCartItem,
//       );
//       update();
//       // await _getCartDetails(_cartService.cart!);
//     } catch (e) {
//       update();
//       _log.e(e);
//       EazySnackBar.buildErronSnackbar(
//         'Failed',
//         'Something went wrong while updating cart',
//       );
//     }
//   }

//   double getTotal() {
//     var total = 0.0;
//     for (final element in _cartService.cart!.productsId!) {
//       final prod = cartItem!.eazyMen.subServiceProdcuts!
//           .firstWhere((prod) => prod.productId == element.id);
//       total += (element.quantity! * prod.price).toDouble();
//     }
//     return total;
//   }

//   double getTaxAmount() {
//     return (getTotal() * .18).roundToDouble();
//   }

//   double getGrandTotal() {
//     return (getTotal() + (getTotal() * .18)).roundToDouble();
//   }

//   VoidFuture _getCartDetails(CartModel cart) async {
//     _log.v('Getting cart details...');
//     final data = await Future.wait([
//       FirebaseFirestore.instance
//           .collection('EazyMen')
//           .where('EazyMan_UID', isEqualTo: cart.eazyMenId)
//           .get(),
//       FirebaseFirestore.instance
//           .collection('ServiceProducts')
//           .where(
//             'ServiceProductID',
//             whereIn: cart.productsId!.map((e) => e.id).toList(),
//           )
//           .get()
//     ]);
//     final eazymenData = data[0];
//     final products = data[1];
//     final eazymen = EazyMenModel.fromJson(eazymenData.docs.first.data());
//     cartItem = BookingCartModel(
//       eazyMen: eazymen,
//       products: products.docs.map((e) {
//         final model = BookingProductModel.fromMap(e.data());

//         return model.copyWith(
//           quantity: getQuantity(model.serviceProductId),
//           price: getPrice(model.serviceProductId, eazymen),
//         );
//       }).toList(),
//       itemTotal: 0,
//       // itemTotal: getTotal(),
//       grandTotal: 0,
//       // tax: getTaxAmount(),
//     );
//   }

  Widget submitButton() {
    return SizedBox(
      width: 120.w,
      height: 40.h,
      child: EazyButtons.fullWidthElevatedButton(
        'Next',
        () {
          Get.to(BookingSummary());
        },
      ),
    );
    //   if (!_customerService.isLoggedIn) {
    //     return CartSubmitButton(
    //       onPressed: () {
    //         CartService.instance.checkout();
    //       },
    //       label: 'Login',
    //     );
    //   }
    //   if (!(_customerService.customer?.isApplicable() ?? false)) {
    //     return const CartSubmitButton(
    //       onPressed: _addDeliveryAddress,
    //       label: 'Add Details',
    //     );
    //   }
    //   // if (!_customerService.customer!.isNotApplicable()) {
    //   //   return const CartSubmitButton(
    //   //     onPressed: _showSavedAddress,
    //   //     label: 'Select Address',
    //   //   );
    //   // }
    //   return CartSubmitButton(
    //     onPressed: () {
    //       // _selectSlot(cartItem);
    //       Get.to(
    //         const SelectServiceSlotView(),
    //         arguments: cartItem!.copyWith(
    //           grandTotal: getGrandTotal(),
    //           tax: getTaxAmount(),
    //           itemTotal: getTotal(),
    //         ),
    //       );
    //     },
    //     label: 'Select slot',
    //   );
    // }
  }

// Future<void> _addDeliveryAddress() {
//   final houseNumber = TextEditingController();
//   final localArea = TextEditingController();
//   final nameController = TextEditingController();
//   final pincodeController = TextEditingController();
//   final cityController = TextEditingController();
//   final stateController = TextEditingController();
//   final landController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//   return Get.bottomSheet(
//     SafeArea(
//       child: EasyContainer(
//         customBorderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(15),
//           topRight: Radius.circular(15),
//         ),
//         //  borderRadius: 10,
//         padding: 10,
//         height: Get.size.height / 1.5,
//         color: EazyColors.white,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             // Row(
//             //   crossAxisAlignment: CrossAxisAlignment.start,
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: [
//             //     Text(
//             //       'Ashok Vihar, Gurgaon \nsector 3, 122001',
//             //       style: Get.textTheme.titleSmall,
//             //     ),
//             //     TextButton(
//             //       style: TextButton.styleFrom(
//             //         padding: EdgeInsets.zero,
//             //         minimumSize: const Size(50, 30),
//             //         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//             //         alignment: Alignment.centerLeft,
//             //       ),
//             //       onPressed: () {},
//             //       child: const Text('Change'),
//             //     ),
//             //   ],
//             // ),
//             // const Divider(),
//             // Space.vertical(10.h),
//             Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   Space.vertical(12.h),
//                   EazyTextField.stringTextField(
//                     'Enter Your Name',
//                     TextInputAction.next,
//                     TextInputType.text,
//                     hintText: 'Enter Your Name',
//                     controller: nameController,
//                   ),
//                   Space.vertical(10.h),
//                   EazyTextField.stringTextField(
//                     'Enter House No./Build Name',
//                     TextInputAction.next,
//                     TextInputType.text,
//                     hintText: 'House No./Build Name',
//                     controller: houseNumber,
//                   ),
//                   Space.vertical(10.h),
//                   EazyTextField.stringTextField(
//                     'Enter Road Name / Area / Colony',
//                     TextInputAction.next,
//                     TextInputType.text,
//                     hintText: 'Road Name / Area / Colony',
//                     controller: localArea,
//                   ),
//                   Space.vertical(10.h),
//                   EazyTextField.stringTextField(
//                     'Enter Area Pincode',
//                     TextInputAction.next,
//                     TextInputType.number,
//                     hintText: 'Pincode',
//                     controller: pincodeController,
//                   ),
//                   Space.vertical(10.h),
//                   Row(
//                     children: [
//                       Flexible(
//                         child: EazyTextField.stringTextField(
//                           'Enter City',
//                           TextInputAction.next,
//                           TextInputType.text,
//                           hintText: 'City',
//                           controller: cityController,
//                         ),
//                       ),
//                       Space.horizontal(10.w),
//                       Flexible(
//                         child: EazyTextField.stringTextField(
//                           'Enter State',
//                           TextInputAction.next,
//                           TextInputType.text,
//                           hintText: 'State',
//                           controller: stateController,
//                         ),
//                       )
//                     ],
//                   ),
//                   Space.vertical(10.h),
//                   EazyTextField.optionalTextField(
//                     hintText: 'Landmark (Optional)',
//                     controller: landController,
//                   )
//                 ],
//               ),
//             ),
//             const Spacer(),
//             EazyButtons.fullWidthElevatedButton(
//               'Save Address',
//               () async {
//                 unawaited(
//                   showDialog(
//                     context: Get.context!,
//                     barrierDismissible: false,
//                     builder: (context) => WillPopScope(
//                       child: const Center(child: EazyLoadingWidget()),
//                       onWillPop: () => Future.value(false),
//                     ),
//                   ),
//                 );
//                 if (formKey.currentState!.validate()) {
//                   FocusScope.of(Get.context!).unfocus();
//                   final notificationService = NotificationService.instance;
//                   final token = await notificationService.getToken();
//                   final address = AddressModel(
//                     houseNumber: houseNumber.text.trim(),
//                     localArea: localArea.text.trim(),
//                     city: cityController.text.trim(),
//                     state: stateController.text.trim(),
//                     pincode: pincodeController.text.trim(),
//                     landMark: landController.text.trim(),
//                   );
//                   final customer = CustomerModel(
//                     id: FirebaseAuth.instance.currentUser!.uid,
//                     phoneNumber:
//                         FirebaseAuth.instance.currentUser!.phoneNumber!,
//                     fcmToken: token,
//                     name: nameController.text.trim(),
//                     addresses: [address],
//                     // houseNumber: houseNumber.text.trim(),
//                     // localArea: localArea.text.trim(),
//                     // city: cityController.text.trim(),
//                     // state: stateController.text.trim(),
//                     // pincode: pincodeController.text.trim(),
//                   );
//                   try {
//                     await FirebaseFirestore.instance
//                         .collection('Customers')
//                         .doc(customer.id)
//                         .set(customer.toJson());
//                     Get
//                       ..back()
//                       ..back()
//                       ..snackbar('Updated details', 'message');
//                     await CustomerService.instance.getCustomerData();
//                     Get.find<CartController>().update();
//                   } catch (e) {
//                     print(e);
//                     EazySnackBar.buildErronSnackbar(
//                       'Something went wrong',
//                       '$e',
//                     );
//                   }
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     ),
//     isScrollControlled: true,
//     ignoreSafeArea: false,
//   );
// }

// Future<void> _showSavedAddress() async {
//   return Get.bottomSheet(
//     EasyContainer(
//       height: Get.size.height / 3,
//       customBorderRadius: const BorderRadius.only(
//         topLeft: Radius.circular(15),
//         topRight: Radius.circular(15),
//       ),
//       child: Column(
//         children: const [
//           ListTile(
//             leading: Icon(
//               Icons.radio_button_on,
//               color: EazyColors.primary,
//             ),
//             title: Text('H.No C-31, Ashok Vihar, Gurgaon'),
//           )
//         ],
//       ),
//     ),
//     isScrollControlled: true,
//   );
}
