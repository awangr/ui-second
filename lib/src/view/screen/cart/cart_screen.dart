import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/app_style.dart';
import 'package:project2/src/controller/project_controller.dart';
import 'package:project2/src/view/widgets/background_img/background_cart_screen.dart';
import 'package:project2/src/view/widgets/empty_widget.dart';

import '../../../../core/app_widget.dart';

final ProjectController controller = Get.put(ProjectController());

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  Widget _bottomAppBar(double height, double width, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      child: BottomAppBar(
        color: AppStyle.backgroundcolor,
        child: SizedBox(
          height: height * 0.40,
          child: InkWell(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            onTap: () {},
            child: Ink(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                  color: AppStyle.grey.withOpacity(0.2),
                  boxShadow: [
                    BoxShadow(
                        color: AppStyle.backgroundcolor,
                        blurRadius: 9,
                        spreadRadius: 3,
                        blurStyle: BlurStyle.outer,
                        offset: Offset(0, 3))
                  ]),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style:
                                  TextStyle(color: AppStyle.grey, fontSize: 25),
                            ),
                            Obx(
                              () {
                                return Text(
                                  '\$ ${controller.subTotalPrice.value}',
                                  style: TextStyle(
                                      color: AppStyle.grey, fontSize: 25),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Taxes",
                              style:
                                  TextStyle(color: AppStyle.grey, fontSize: 20),
                            ),
                            Text("\$${5.00}",
                                style: TextStyle(
                                    color: AppStyle.grey, fontSize: 20)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(thickness: 4.0, height: 30.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style:
                                  TextStyle(color: AppStyle.grey, fontSize: 30),
                            ),
                            Obx(
                              () {
                                return Text(
                                  controller.totalPrice.value == 5.0
                                      ? "\$0.0"
                                      : "\$${controller.totalPrice}",
                                  style: TextStyle(
                                      color: AppStyle.grey, fontSize: 30),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.1),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        AppStyle.grey)),
                            onPressed: () {},
                            child: const Text(
                              "Checkout",
                              style: TextStyle(
                                  color: AppStyle.backgroundcolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget booktListView(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemBuilder: (_, index) {
          return Dismissible(
            key: Key(controller.cartBook[index].name),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppStyle.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: AppBlur.blurInkBig),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(controller.cartBook[index].image,
                            width: 100),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  controller.cartBook[index].name,
                                  style: TextStyle(
                                      color: AppStyle.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "\$${controller.cartBook[index].price}",
                              style: TextStyle(
                                  color: AppStyle.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(7),
                                  onTap: () => controller
                                      .descreseItem(controller.cartBook[index]),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: AppStyle.backgroundcolor,
                                    ),
                                    child: Icon(Icons.remove,
                                        color: AppStyle.grey),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  controller.cartBook[index].quantity
                                      .toString(),
                                  style: TextStyle(
                                      color: AppStyle.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 10),
                                InkWell(
                                  borderRadius: BorderRadius.circular(7),
                                  onTap: () => controller
                                      .increseItem(controller.cartBook[index]),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: AppStyle.backgroundcolor,
                                    ),
                                    child:
                                        Icon(Icons.add, color: AppStyle.grey),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.horizontal) {
                controller.removeCart(index);
              }
            },
            background: Container(
              color: AppStyle.backgroundcolor,
              child: Icon(Icons.check),
            ),
          );
        },
        separatorBuilder: (_, __) => const Padding(padding: EdgeInsets.all(10)),
        itemCount: controller.cartBook.length);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(children: [
      BackgroundCart(),
      Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: controller.cartBook.isNotEmpty
            ? _bottomAppBar(width, height, context)
            : const SizedBox(),
        body: EmptyWidget(
            condition: controller.cartBook.isNotEmpty,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: height * 0.8,
                child: GetBuilder(
                  builder: (ProjectController controller) =>
                      booktListView(context),
                ),
              ),
            ),
            title: 'Empty Cart'),
      ),
    ]);
  }
}
