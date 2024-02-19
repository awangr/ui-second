import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/app_style.dart';
import 'package:project2/src/controller/project_controller.dart';
import 'package:project2/src/models/book.dart';
import 'package:project2/src/view/widgets/background_img/background_favorite_screen.dart';
import 'package:project2/src/view/widgets/empty_widget.dart';

import '../../../../core/app_widget.dart';

final ProjectController controller = Get.put(ProjectController());

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundFavorite(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: EmptyWidget(
            title: 'Empty Favorite',
            type: EmptyWidgetType.favorite,
            condition: controller.favoriteBook.isNotEmpty,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Book book = controller.favoriteBook[index];
                    return SizedBox(
                      height: 100,
                      child: InkWell(
                        child: Ink(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppStyle.grey.withOpacity(0.1),
                              boxShadow: AppBlur.blurInkBig),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            title: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                book.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: AppStyle.backgroundcolor),
                              ),
                            ),
                            leading: Image.asset(book.image, height: 100),
                            subtitle: Text(
                              book.desc,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: AppStyle.grey),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      controller.isFavorite(book);
                                    });
                                  },
                                  icon: book.isFavorite
                                      ? const Icon(Icons.favorite)
                                      : const Icon(Icons.favorite_outline),
                                  color: AppStyle.backgroundcolor),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return Padding(padding: EdgeInsets.only(bottom: 15));
                  },
                  itemCount: controller.favoriteBook.length),
            ),
          )),
    ]);
  }
}
