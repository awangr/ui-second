import 'package:flutter/material.dart';
import 'package:project2/core/app_assets.dart';
import 'package:project2/core/app_style.dart';

enum EmptyWidgetType { cart, favorite }

class EmptyWidget extends StatelessWidget {
  const EmptyWidget(
      {super.key,
      this.type = EmptyWidgetType.cart,
      required this.child,
      required this.title,
      this.condition = false});
  final String title;
  final EmptyWidgetType type;
  final bool condition;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return condition
        ? child
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                type == EmptyWidgetType.cart
                    ? Image.asset(AppAssets.emptyCart, width: 300)
                    : Image.asset(AppAssets.emptyFavorite, width: 250),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: AppStyle.grey),
                )
              ],
            ),
          );
  }
}
