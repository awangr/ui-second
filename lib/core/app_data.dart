import 'package:flutter/material.dart';

import 'package:project2/core/app_assets.dart';
import 'package:project2/core/app_style.dart';
import 'package:project2/src/controller/authC.dart';
import 'package:project2/src/models/book.dart';
import 'package:project2/src/models/book_category.dart';
import 'package:project2/src/models/bottom_naviagtion_model.dart';
import 'package:project2/src/models/listtile_model.dart';
import 'package:project2/src/view/screen/profile/changepasword.dart';
import 'package:project2/src/view/screen/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:project2/src/view/screen/profile/address_screen.dart';
import 'package:project2/src/view/screen/profile/payment_screen.dart';

import '../src/models/address.dart';
import '../src/models/payment.dart';
import '../src/view/screen/profile/country_screen.dart';
import '../src/view/screen/profile/language_screen.dart';

class AppData {
  AppData._();

  static List<BottomNavigationModel> bottomNavigationItems = [
    BottomNavigationModel(const Icon(Icons.home_outlined, color: AppStyle.grey),
        const Icon(Icons.home, color: AppStyle.backgroundcolor), 'Home'),
    BottomNavigationModel(
        const Icon(Icons.shopping_cart_outlined, color: AppStyle.grey),
        const Icon(Icons.shopping_cart, color: AppStyle.backgroundcolor),
        'Cart'),
    BottomNavigationModel(
        const Icon(Icons.favorite_outline, color: AppStyle.grey),
        const Icon(Icons.favorite, color: AppStyle.backgroundcolor),
        'Favorite'),
    BottomNavigationModel(
        const Icon(Icons.person_outline, color: AppStyle.grey),
        const Icon(Icons.person, color: AppStyle.backgroundcolor),
        'Profile'),
  ];
  static List<BookCategory> categories = [
    BookCategory(BookType.All, true),
    BookCategory(BookType.Nonfiksi, false),
    BookCategory(BookType.Fantasi, false),
    BookCategory(BookType.Romance, false),
    BookCategory(BookType.Horor, false),
  ];
  static const dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting "
      "industry. Lorem Ipsum has been the industry's standard dummy text ever "
      "since the 1500s, when an unknown printer took a galley of type and "
      "scrambled it to make a type specimen book. It has survived not only five "
      "centuries, but also the leap into electronic typesetting, remaining "
      "essentially unchanged. It was popularised in the 1960s with the release "
      "of Letraset sheets containing Lorem Ipsum passages, and more recently "
      "with desktop publishing software like Aldus PageMaker including versions "
      "of Lorem Ipsum.";
  static List<Book> bookItems = [
    Book(AppAssets.harry, 'Harry Potter', dummyText, false, 13, 1, 4.0,
        BookType.Fantasi, 150),
    Book(AppAssets.ruca, 'Rumah Kaca', dummyText, false, 14, 1, 4.0,
        BookType.Horor, 150),
    Book(AppAssets.alaska, 'Teluk Alaska', dummyText, false, 1, 1, 4.9,
        BookType.Romance, 150),
    Book(AppAssets.apaadanya, 'Apa Adanya', dummyText, false, 2, 1, 4.5,
        BookType.Nonfiksi, 150),
    Book(AppAssets.parable, 'Parable', dummyText, false, 11, 1, 4.0,
        BookType.Fantasi, 150),
    Book(AppAssets.arya, 'Arya', dummyText, false, 3, 1, 4.6, BookType.Romance,
        150),
    Book(AppAssets.teras, 'Filosofi Teras', dummyText, false, 15, 1, 4.0,
        BookType.Nonfiksi, 150),
    Book(AppAssets.friend, 'Friend', dummyText, false, 5, 1, 4.5,
        BookType.Fantasi, 150),
    Book(AppAssets.risk, 'Risk', dummyText, false, 6, 1, 4.0, BookType.Horor,
        150),
    Book(AppAssets.gaji, 'Bukan Budak Gaji', dummyText, false, 7, 1, 4.0,
        BookType.Horor, 150),
    Book(AppAssets.hukum, 'Hukum dan Etika', dummyText, false, 8, 1, 4.0,
        BookType.Nonfiksi, 150),
    Book(AppAssets.positif, 'Positif Thinking', dummyText, false, 12, 1, 4.0,
        BookType.Horor, 150),
    Book(AppAssets.marioposa, 'Marioposa', dummyText, false, 10, 1, 4.0,
        BookType.Romance, 150),
    Book(AppAssets.dear, 'Dear Imam', dummyText, false, 4, 1, 5.0,
        BookType.Romance, 150),
  ];

  static List<ListTileModel> listTileItems = [
    ListTileModel(
      title: 'Change Password',
      leading: Icon(Icons.lock, color: AppStyle.backgroundcolor),
      trailing: Icon(Icons.navigate_next, color: AppStyle.grey),
      onTap: () {
        Get.to(ChangePassword(),
            duration: Duration(milliseconds: 380), transition: Transition.zoom);
      },
    ),
    ListTileModel(
      title: 'Payment',
      leading: Icon(Icons.payment, color: AppStyle.backgroundcolor),
      trailing: Icon(Icons.navigate_next, color: AppStyle.grey),
      onTap: () {
        Get.to(PaymentScreen(),
            duration: Duration(milliseconds: 380), transition: Transition.zoom);
      },
    ),
    ListTileModel(
      title: 'Language',
      leading: Icon(Icons.language_outlined, color: AppStyle.backgroundcolor),
      trailing: Icon(Icons.navigate_next, color: AppStyle.grey),
      onTap: () {
        Get.to(LanguageScreen(),
            duration: Duration(milliseconds: 380), transition: Transition.zoom);
      },
    ),
    ListTileModel(
      title: 'Country',
      leading: Icon(Icons.flag_outlined, color: AppStyle.backgroundcolor),
      trailing: Icon(
        Icons.navigate_next,
        color: AppStyle.grey,
      ),
      onTap: () {
        Get.to(CountryScreen(),
            duration: Duration(milliseconds: 380), transition: Transition.zoom);
      },
    ),
    ListTileModel(
      title: 'Address',
      leading: Icon(Icons.location_on, color: AppStyle.backgroundcolor),
      trailing: Icon(Icons.navigate_next, color: AppStyle.grey),
      onTap: () {
        Get.to(AddressScreen(),
            duration: Duration(milliseconds: 380), transition: Transition.zoom);
      },
    ),
    ListTileModel(
        title: 'Logout',
        leading: Icon(Icons.logout, color: AppStyle.backgroundcolor),
        trailing: Icon(Icons.navigate_next, color: AppStyle.grey),
        onTap: () {
          Get.find<AuthC>().logout();
        }),
  ];
  static dialog() {
    return Get.defaultDialog(
        backgroundColor: AppStyle.backgroundcolor.withOpacity(0.6),
        title: 'Logout',
        content: Text(
          'Anda yakin ingin logout ? ',
          style: TextStyle(color: AppStyle.grey),
        ),
        titleStyle:
            TextStyle(fontWeight: FontWeight.bold, color: AppStyle.grey),
        cancel: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: AppStyle.grey),
          ),
        ),
        confirm: OutlinedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll<Color>(AppStyle.grey)),
            onPressed: () async {
              Get.dialog(Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppStyle.backgroundcolor,
                  color: AppStyle.grey,
                ),
              ));
              await Future.delayed(Duration(seconds: 3));
              Get.snackbar('Success', 'Berhasil Logout',
                  backgroundColor: AppStyle.backgroundcolor);
              Get.to(LoginScreen(),
                  duration: Duration(milliseconds: 380),
                  transition: Transition.zoom);
            },
            child: Text(
              'Confirm',
              style: TextStyle(color: AppStyle.backgroundcolor),
            )));
  }

  static List<Address> listAddres = [
    Address(
        name: 'Zahmad',
        no: '08951231231',
        ig: '@zahmad.r',
        addrs: 'SERANG,WARINGINKURUNG,SASAHAN'),
    Address(
        name: 'Zamrud',
        no: '08951238989',
        ig: '@zamrud',
        addrs: 'SERANG,TUNJUNG TEJA,BOJONG CATANG'),
    Address(
        name: 'Zaidan',
        no: '089523267777',
        ig: '@zaidan.ar',
        addrs: 'SERANG,CIRUAS,BEBERAN'),
    Address(
        name: 'Zahra',
        no: '089512397753',
        ig: '@zahra.s',
        addrs: 'SERANG,GUNUNG SARI ,LUWUK'),
  ];
  static List<Payment> listPayment = [
    Payment(
      title: 'COD (Bayar di Tempat)',
      Subtitle: 'Cash on Delivery',
      leading: Icon(Icons.add_shopping_cart, color: AppStyle.grey),
      trailing: '',
      tiles: [],
    ),
    Payment(
      title: 'PayLater (Rp.5.000.000 tersisa)',
      Subtitle: 'Beli Sekarang Bayar bulan depan',
      leading: Icon(
        Icons.aspect_ratio_outlined,
        color: AppStyle.grey,
      ),
      trailing: '',
      tiles: [
        Payment(
            title: 'Beli Sekarang,bayar nanti',
            Subtitle: 'Rp.2.000.000 Tersisa',
            leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(Icons.wallet, color: AppStyle.grey),
            ),
            trailing: 'Rp.50.000'),
        Payment(
            title: 'Cicilan 3X',
            Subtitle: '',
            leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(Icons.wallet, color: AppStyle.grey),
            ),
            trailing: 'Rp.20.000/bulan'),
        Payment(
            title: 'Cicilan 6X',
            Subtitle: '',
            leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(Icons.wallet, color: AppStyle.grey),
            ),
            trailing: 'Rp.10.000/bulan'),
        Payment(
            title: 'Cicilan 12X',
            Subtitle: '',
            leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(
                Icons.wallet,
                color: AppStyle.grey,
              ),
            ),
            trailing: 'Rp.4.100/bulan')
      ],
    ),
    Payment(
      title: 'Transfer Bank',
      Subtitle: '',
      leading:
          Icon(Icons.transfer_within_a_station_rounded, color: AppStyle.grey),
      trailing: '',
      tiles: [
        Payment(
          title: 'Bca',
          Subtitle: 'Bebas biaya penanganan',
          leading: Container(
              width: 80,
              height: 80,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Image.asset('assets/bank/bca.png'),
              )),
          trailing: '',
        ),
        Payment(
          title: 'Bjb',
          Subtitle: '',
          leading: Container(
              width: 80,
              height: 80,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Image.asset('assets/bank/bjb.png'),
              )),
          trailing: '',
        ),
        Payment(
          title: 'Bri',
          Subtitle: '',
          leading: Container(
              width: 80,
              height: 80,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Image.asset('assets/bank/bri.png'),
              )),
          trailing: '',
        ),
        Payment(
          title: 'Mandiri',
          Subtitle: '',
          leading: Container(
              width: 80,
              height: 80,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Image.asset('assets/bank/mandiri.png'),
              )),
          trailing: '',
        )
      ],
    ),
  ];
}
