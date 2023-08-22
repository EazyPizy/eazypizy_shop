import 'package:eazypizy_shop/module/Cart/views/view_cart.dart';
import 'package:eazypizy_shop/module/home/components/product_tile.dart';
import 'package:eazypizy_shop/widgets/cart_bottom_bar.dart';
import 'package:eazypizy_shop/widgets/eazy_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/theme.dart';

class SubCategoryView extends StatelessWidget {
  const SubCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Category'),
      ),
      body: CustomTabView(
        itemCount: 11,
        onPositionChange: (value) {},
        onScroll: (value) {},
        initPosition: 0,
        tabBuilder: (context, index) => Tab(text: 'Tab $index'),
        pageBuilder: (context, index) => ListView.separated(
          itemCount: 11,
          separatorBuilder: (context, index) => Space.vertical(2),
          itemBuilder: (context, index) => ProductTile(),
        ),
      ),
      bottomNavigationBar: CartBottomBar(
        items: 1,
        total: 123,
        buttonWidget: EazyButtons.flexWidthElevatedButton(
          'Cart',
          () {
            Get.to(CartView());
          },
          1,
        ),
      ),
    );
  }
}
