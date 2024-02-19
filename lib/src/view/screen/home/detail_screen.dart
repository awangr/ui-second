import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/app_style.dart';
import 'package:project2/src/controller/project_controller.dart';
import 'package:project2/src/models/book.dart';

final ProjectController controller = Get.put(ProjectController());

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.book});
  final Book book;
  Widget fav(VoidCallback ontap) {
    return IconButton(
      onPressed: ontap,
      icon: book.isFavorite
          ? const Icon(Icons.favorite, color: AppStyle.backgroundcolor)
          : const Icon(
              Icons.favorite_outline,
              color: AppStyle.backgroundcolor,
            ),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context) {
    return AppBar(elevation: 0, backgroundColor: AppStyle.backgroundcolor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundcolor,
      appBar: _appbar(context),
      body: Column(
        children: [
          Container(
            color: AppStyle.backgroundcolor,
            height: MediaQuery.of(context).size.height * .35,
            width: double.infinity,
            child: Image.asset(
              book.image,
              width: 200,
            ),
            padding: EdgeInsets.only(bottom: 30),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40, right: 14, left: 14),
                  decoration: BoxDecoration(
                    color: AppStyle.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(4)),
                              width: MediaQuery.of(context).size.width * .15,
                              height: 8,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              book.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              '\$${book.price.toString()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          book.desc,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            GetBuilder(
                              builder: (ProjectController controller) {
                                return fav(() => controller.isFavorite(book));
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                height: 35,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppStyle.backgroundcolor,
                                  ),
                                  onPressed: () => controller.addToCart(book),
                                  child: Text('Add To Cart'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
