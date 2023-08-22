import 'package:eazypizy_shop/module/home/views/view_subCategory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryChipCard extends StatelessWidget {
  final String name;

  SubCategoryChipCard(
    this.name,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.to(SubCategoryView());
        },
        child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: Card(
                    color: Colors.red,
                    //elevation: .5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/Brand_Image%2Fimage_picker5777462274495448466.jpg?alt=media&token=cecaf930-bd2f-44f4-a4dc-849bdc94e6fb",
                        width: 120,
                        height: 150,
                        //color: Colors.red,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                ),
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ])));
  }
}
