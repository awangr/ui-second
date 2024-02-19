import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/app_data.dart';
import 'package:project2/core/app_style.dart';

import 'package:project2/core/app_widget.dart';
import 'package:project2/src/controller/project_controller.dart';
import 'package:project2/src/models/listtile_model.dart';
import '../../../../core/app_assets.dart';
import '../../widgets/background_img/background_profile.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundPofile(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: AppStyle.backgroundcolor,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppStyle.backgroundcolor,
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75),
                        blurStyle: BlurStyle.outer),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    CircleAvatar(
                      backgroundColor: AppStyle.grey,
                      radius: 60,
                      child: CircleAvatar(
                          backgroundColor:
                              AppStyle.backgroundcolor.withOpacity(0.5),
                          radius: 55,
                          backgroundImage: AssetImage(AppAssets.imgSplash)),
                    ),
                    SizedBox(height: 5),
                    Text(
                      AppProfile.name_profile,
                      style: GoogleFonts.lilitaOne(
                        color: AppStyle.grey,
                        textStyle: TextStyle(fontSize: 30),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      AppProfile.email_profile,
                      style: GoogleFonts.shrikhand(
                          color: AppStyle.grey, fontSize: 20),
                    ),
                    SizedBox(height: 5),
                    Text(
                      AppProfile.no_profile,
                      style: GoogleFonts.faustina(
                          color: AppStyle.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: GetBuilder(
                builder: (ProjectController controller) {
                  return Ink(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    height: 400,
                    child: ListView.separated(
                        itemBuilder: (_, index) {
                          ListTileModel listTileModel =
                              AppData.listTileItems[index];
                          return InkWell(
                            onTap: listTileModel.onTap,
                            borderRadius: BorderRadius.circular(15),
                            child: Ink(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 7,
                                    color: AppStyle.backgroundcolor
                                        .withOpacity(0.8),
                                    spreadRadius: 3,
                                    blurStyle: BlurStyle.outer,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: AppStyle.grey.withOpacity(0.3),
                              ),
                              height: 50,
                              child: ListTile(
                                leading: listTileModel.leading,
                                trailing: listTileModel.trailing,
                                title: Text(
                                  listTileModel.title.toString(),
                                  style: TextStyle(color: AppStyle.grey),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) {
                          return Padding(padding: EdgeInsets.all(10));
                        },
                        itemCount: AppData.listTileItems.length),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
