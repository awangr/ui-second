import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project2/core/app_data.dart';
import 'package:project2/core/app_style.dart';
import 'package:project2/src/controller/project_controller.dart';
import 'package:project2/src/view/screen/home/list_screen.dart';

import '../../widgets/page_transition.dart';
import '../cart/cart_screen.dart';
import '../favorite/favorite_screen.dart';
import '../profile/profile_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

final ProjectController controller = Get.put(ProjectController());

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Widget> screen = [
    const ListScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() =>
            PageTransition(child: screen[controller.currentBottomIndex.value])),
        bottomNavigationBar: ConvexAppBar(
            backgroundColor: AppStyle.backgroundcolor,
            elevation: 0,
            activeColor: AppStyle.grey,
            onTap: controller.switchBottomNavigation,
            curve: Curves.ease,
            items: AppData.bottomNavigationItems.map((e) {
              return TabItem(
                  icon: e.disableIcon,
                  activeIcon: e.enableIcon,
                  title: e.label);
            }).toList()));
  }
}
