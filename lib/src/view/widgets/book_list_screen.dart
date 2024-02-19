import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project2/core/app_style.dart';
import 'package:project2/src/models/book.dart';

import '../../../core/app_widget.dart';
import '../screen/home/detail_screen.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen(
      {super.key, this.isreversed = false, required this.books});
  final bool isreversed;
  final List<Book> books;
  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  late bool isload;
  @override
  void initState() {
    isload = true;
    Future.delayed(
      Duration(milliseconds: 1000),
      () {
        setState(() {
          isload = false;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: isload
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: AppStyle.backgroundcolor,
                color: AppStyle.grey,
              ),
            )
          : ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.isreversed ? 5 : widget.books.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                Book book = widget.isreversed
                    ? widget.books.reversed.toList()[index]
                    : widget.books[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Get.to(DetailScreen(book: book),
                        duration: Duration(milliseconds: 380),
                        transition: Transition.zoom);
                  },
                  child: Ink(
                    width: 200,
                    decoration: BoxDecoration(
                      boxShadow: AppBlur.blurInkBig,
                      color: AppStyle.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            book.image,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            '\$${book.price.toString()}',
                            style: TextStyle(
                                color: AppStyle.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            book.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppStyle.backgroundcolor),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) {
                return const Padding(padding: EdgeInsets.only(right: 40));
              },
            ),
    );
  }
}
