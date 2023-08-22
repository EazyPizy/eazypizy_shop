library eazypizy_shop;

import 'package:eazypizy_shop/module/home/components/MainCategoryCard.dart';
import 'package:flutter/material.dart';

class ShopHomeWidget extends StatelessWidget {
  ShopHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> mainCategory = [
      'Category 1',
      'Category 2',
      'Category 3',
      'Category 4',
    ];
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.green,
              surfaceTintColor: Colors.green,
              pinned: true,
              expandedHeight: 340,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Hardware Store',
                  style: TextStyle(fontSize: 25),
                ),
                background: Container(
                  color: Colors.amber,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.blue,
                child: Column(),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: mainCategory.length,
                itemBuilder: (ctx, i) => MainCategoryCard(mainCategory[i]),
              ),
              //Text("Sliver App Bar"),
            ],
          ),
        ),
      ),
    );
  }
}
