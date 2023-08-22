import 'package:eazypizy_shop/module/home/components/sub_categoryChipcard.dart';
import 'package:flutter/material.dart';

class MainCategoryCard extends StatefulWidget {
  final String mainCategoryTitle;

  MainCategoryCard(
    this.mainCategoryTitle,
  );

  @override
  _MainCategoryCardState createState() => _MainCategoryCardState();
}

class _MainCategoryCardState extends State<MainCategoryCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              height: 200,
              width: double.infinity,
              //fit: BoxFit.cover,

              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                      child: Container(
                        color: Colors.white,
                        width: 200,
                        child: Text(
                          widget.mainCategoryTitle,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 120,
                      child: buildSubCat(),
                    ),
                  ]),
            )
          ],
        ),
      ),
    ]);
  }

  List<String> subCategory = [
    'subCat 1',
    'subCat 1',
    'subCat 1',
    'subCat 1',
    'subCat 1',
    'subCat 1',
    'subCat 1',
    'subCat 1',
    'subCat 1',
    'subCat 1',
    'subCat 1',
    'subCat 1',
    'subCat 1',
  ];

  Widget buildSubCat() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: subCategory.length,
      itemBuilder: (context, index) => SubCategoryChipCard(subCategory[index]),
    );
  }
}
