import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/app_data.dart';
import 'package:project2/src/controller/project_controller.dart';
import 'package:project2/src/models/book.dart';
import 'package:project2/src/models/book_category.dart';

import '../../../../core/app_assets.dart';
import '../../../../core/app_style.dart';

import '../../widgets/background_img/background_list.dart';
import '../../widgets/book_list_screen.dart';

final ProjectController controller = Get.put(ProjectController());

class ListScreen extends StatefulWidget {
  const ListScreen({super.key, this.isReversed = false});
  final bool isReversed;
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Book> box = AppData.bookItems;
  @override
  void initState() {
    controller.searchitems.value = AppData.bookItems;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    PreferredSizeWidget _appbar() {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: AppStyle.grey),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              backgroundColor: AppStyle.white,
              radius: 20,
              child: Center(
                child: Image.asset(
                  AppAssets.imgSplash,
                  fit: BoxFit.fill,
                  width: 40,
                ),
              ),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      );
    }

    return Stack(
      children: [
        BackgroundList(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _appbar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome To The Library',
                          style: TextStyle(
                              color: AppStyle.backgroundcolor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text('What do you want to read today?',
                            style: AppStyle.bigtext),
                      ],
                    ),
                  ),
                  SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppStyle.grey.withOpacity(0.8),
                          boxShadow: [
                            BoxShadow(
                                color:
                                    AppStyle.backgroundcolor.withOpacity(0.7),
                                blurRadius: 1,
                                spreadRadius: 3,
                                offset: Offset(0, 3))
                          ]),
                      child: TextField(
                        onChanged: (value) => searchBooks(value),
                        style: TextStyle(color: Colors.black54),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mic),
                          prefixIconColor: AppStyle.backgroundcolor,
                          suffixIconColor: AppStyle.backgroundcolor,
                          suffixIcon: Icon(Icons.search),
                          suffixStyle:
                              TextStyle(color: AppStyle.backgroundcolor),
                          border: InputBorder.none,
                          labelText: 'Search',
                          labelStyle:
                              TextStyle(color: AppStyle.backgroundcolor),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: SizedBox(
                      height: 45,
                      child: GetBuilder(
                        builder: (ProjectController controller) {
                          return ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                BookCategory category =
                                    AppData.categories[index];
                                return InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    controller.filterItemCategory(category);
                                  },
                                  child: Ink(
                                    width: width / 5,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: category.isSelected
                                                  ? AppStyle.grey
                                                      .withOpacity(0.7)
                                                  : AppStyle.backgroundcolor
                                                      .withOpacity(0.7),
                                              blurRadius: 1,
                                              spreadRadius: 3,
                                              offset: Offset(0, 3))
                                        ],
                                        color: category.isSelected
                                            ? AppStyle.backgroundcolor
                                                .withOpacity(0.8)
                                            : AppStyle.grey.withOpacity(0.8)),
                                    child: Center(
                                      child: Text(
                                        category.type.name,
                                        style: TextStyle(
                                            color: category.isSelected
                                                ? AppStyle.grey
                                                : AppStyle.backgroundcolor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (_, __) {
                                return Padding(padding: EdgeInsets.all(10));
                              },
                              itemCount: AppData.categories.length);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: GetBuilder(
                      builder: (ProjectController controller) {
                        return BookListScreen(books: controller.filteredBook);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void searchBooks(String query) {
    final suggestions = AppData.bookItems.where((book) {
      final booksTitle = book.name.toLowerCase();
      final input = query.toLowerCase();
      return booksTitle.contains(input);
    }).toList();
    setState(() => box = suggestions);
  }
}
