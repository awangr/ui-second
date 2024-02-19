import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/src/view/widgets/responsive/responsive_layout.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class ButtonInfo {
  String title;
  IconData icon;
  ButtonInfo({required this.icon, required this.title});
}

int currentIndex = 0;
List<ButtonInfo> buttonName = [
  ButtonInfo(icon: Icons.home, title: 'Home'),
  ButtonInfo(icon: Icons.settings, title: 'Setting'),
  ButtonInfo(icon: Icons.notifications, title: 'Notification'),
  ButtonInfo(icon: Icons.contact_phone, title: 'Contact'),
  ButtonInfo(icon: Icons.home, title: 'Home'),
  ButtonInfo(icon: Icons.sell, title: 'Sales'),
  ButtonInfo(icon: Icons.security, title: 'Security'),
  ButtonInfo(icon: Icons.person, title: 'User'),
];

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Admin Menu',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: ResponsiveLayout.isDesktop(context)
                    ? null
                    : IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close, color: Colors.white)),
              ),
              Divider(),
              ...List.generate(
                buttonName.length,
                (index) => Column(
                  children: [
                    Container(
                      decoration: index == currentIndex
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.red.withOpacity(0.9),
                                  Colors.orangeAccent.withOpacity(0.9)
                                ],
                              ),
                            )
                          : null,
                      child: ListTile(
                        leading: Icon(
                          buttonName[index].icon,
                          color: Colors.white,
                        ),
                        title: Text(
                          buttonName[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
