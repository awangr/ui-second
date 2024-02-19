import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project2/core/app_data.dart';
import 'package:project2/core/app_style.dart';
import 'package:project2/src/models/book.dart';
import 'package:project2/src/models/book_category.dart';

class ProjectController extends GetxController {
  RxBool loading = false.obs;
  RxList<Book> cartBook = <Book>[].obs;
  RxDouble subTotalPrice = 0.0.obs;
  RxList<Book> favoriteBook = <Book>[].obs;
  RxList<Book> searchitems = <Book>[].obs;
  //BottomNavigation
  RxInt currentBottomIndex = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  RxList<Book> filteredBook = AppData.bookItems.obs;

  void switchBottomNavigation(int index) {
    currentBottomIndex.value = index;
  }

  filterItemCategory(BookCategory category) {
    for (var e in AppData.categories) {
      e.isSelected = false;
    }
    category.isSelected = true;
    if (category.type == BookType.All) {
      filteredBook.assignAll(AppData.bookItems.obs);
    } else {
      filteredBook.assignAll(
        AppData.bookItems.where(
          (item) {
            return item.type == category.type;
          },
        ),
      );
    }
    update();
    filteredBook.refresh();
  }

  isFavorite(Book book) {
    book.isFavorite = !book.isFavorite;
    update();
    if (book.isFavorite) {
      favoriteBook.add(book);
      Get.snackbar('Suksees', 'Berhasil menambahkan ${book.name} ke Favorite',
          icon: Icon(
            Icons.favorite,
            color: AppStyle.backgroundcolor,
          ),
          colorText: AppStyle.backgroundcolor,
          backgroundColor: AppStyle.grey,
          duration: Duration(seconds: 1));
    }
    if (!book.isFavorite) {
      Get.snackbar('Sukses', 'You have remove ${book.name}',
          icon: Icon(Icons.favorite_outline, color: Colors.pink),
          colorText: Colors.pink,
          backgroundColor: AppStyle.grey,
          duration: Duration(seconds: 1));
      favoriteBook.removeWhere((element) => element == book);
    }
  }

  calculateTotalPrice() {
    totalPrice.value = 5;
    for (var e in cartBook) {
      totalPrice.value += e.quantity * e.price;
    }
    if (totalPrice.value > 0) {
      subTotalPrice.value = totalPrice.value - 5;
    }
  }

  addToCart(Book book) async {
    Get.snackbar('Suksees', 'Berhasil menambahkan ${book.name} ke Cart',
        colorText: AppStyle.backgroundcolor,
        icon: Icon(Icons.shopping_cart, color: AppStyle.backgroundcolor),
        backgroundColor: AppStyle.grey,
        duration: Duration(seconds: 1));
    if (book.quantity > 0) {
      cartBook.add(book);
      calculateTotalPrice();
    } else if (book.quantity < 0) {
      Get.snackbar('Sukses', 'You have remove ${book.name}',
          icon: Icon(Icons.shopping_cart_outlined, color: Colors.pink),
          colorText: Colors.pink,
          backgroundColor: AppStyle.grey,
          duration: Duration(seconds: 1));
    }
  }

  removeCart(int index) {
    cartBook.removeAt(index);
    calculateTotalPrice();
    update();
  }

  void increseItem(Book book) {
    book.quantity++;
    update();
    calculateTotalPrice();
  }

  void descreseItem(Book book) {
    book.quantity = book.quantity-- < 1 ? 0 : book.quantity--;
    calculateTotalPrice();
    update();
    if (book.quantity < 1) {
      cartBook.removeWhere((element) => element == book);
    }
  }
}
