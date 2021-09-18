import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitri_official/a_Home/Home.dart';
import 'package:hitri_official/b_Friend/Friend.dart';
import 'package:hitri_official/e_Tabbar/Toolbar.dart';
import 'package:hitri_official/f_Widget/Model.dart';
import 'package:hitri_official/f_Widget/Provider.dart';
import 'package:hitri_official/f_Widget/Sizconfig.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';


Widget screenState = HomeScreen();
int selectedMenuItem = 0;
String pageIcons = 'home';
void setPageTitle() {
  switch (selectedMenuItem) {
    case 0:
      pageIcons = "home";
      print(pageIcons);
      screenState = HomeScreen();
      break;
    case 1:
      pageIcons = "friend";
      print(pageIcons);
      screenState = FriendScreen();
      break;
    case 2:
      pageIcons = "store";
      print(pageIcons);
      break;
    case 3:
      pageIcons = "profile";
      print(pageIcons);
      break;
    case 4:
      pageIcons = "my cart";
      print(pageIcons);
      break;
    case 5:
      pageIcons = "requests";
      print(pageIcons);
      break;
    case 6:
      pageIcons = "notification setting";
      print(pageIcons);
      break;
    case 7:
      pageIcons = "theme design";
      print(pageIcons);
      break;
    case 8:
      pageIcons = "help/documents";
      print(pageIcons);
      break;
    case 9:
      pageIcons = "more setting";
      print(pageIcons);
      break;
  }
}
class HomePanal extends StatefulWidget {
  const HomePanal({Key key}) : super(key: key);

  @override
  _HomePanalState createState() => _HomePanalState();
}

class _HomePanalState extends State<HomePanal> {




  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(MainConfig.screenWidth, MainConfig.screenHeight),
    );
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: Colors.transparent,
            child: Container(
              height: 65.h,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, -1),
                                color: !themeProvider.isDarkMode
                                    ? Color(0xFFD6D6D6)
                                    : Color(0xFF494949),
                                blurRadius: 1)
                          ]),
                      height: 50.h,
                      width: ScreenUtil().screenWidth,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 15.w,
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedMenuItem = 0;
                                    setPageTitle();
                                  });
                                },
                                child: MenuItem(
                                  menuIcons: menuIcons[0],
                                  menuColor: menuColor[0],
                                  menuText: menuText[0],
                                  position: 0,
                                  selected: selectedMenuItem,
                                )),
                          ),
                          Positioned(
                            left: 80.w,
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedMenuItem = 1;
                                    setPageTitle();
                                  });
                                },
                                child: MenuItem(
                                  menuIcons: menuIcons[1],
                                  menuColor: menuColor[1],
                                  menuText: menuText[1],
                                  position: 1,
                                  selected: selectedMenuItem,
                                )),
                          ),
                          Positioned(
                            right: 80.w,
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedMenuItem = 2;
                                    setPageTitle();
                                  });
                                },
                                child: MenuItem(
                                  menuIcons: menuIcons[2],
                                  menuColor: menuColor[2],
                                  menuText: menuText[2],
                                  position: 2,
                                  selected: selectedMenuItem,
                                )),
                          ),
                          Positioned(
                            right: 15.w,
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedMenuItem = 3;
                                    setPageTitle();
                                  });
                                },
                                child: MenuItem(
                                  menuIcons: menuIcons[3],
                                  menuColor: menuColor[3],
                                  menuText: menuText[3],
                                  position: 3,
                                  selected: selectedMenuItem,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 55.h,
                      width: 55.h,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: !themeProvider.isDarkMode
                                    ? Colors.white
                                    : Color(0xFF494949),
                                offset: Offset(-1.0, -1.0),
                                blurRadius: 5.0,
                                spreadRadius: 1),
                            BoxShadow(
                                color: !themeProvider.isDarkMode
                                    ? Colors.grey[350]
                                    : Color(0xFF121212),
                                offset: Offset(2.0, 2.0),
                                blurRadius: 5.0,
                                spreadRadius: 2),
                          ],
                          gradient: LinearGradient(
                              end: Alignment.topLeft,
                              begin: Alignment.bottomRight,
                              colors: [
                                !themeProvider.isDarkMode
                                    ? Colors.white
                                    : Color(0xFF404040),
                                !themeProvider.isDarkMode
                                    ? Colors.grey[350]
                                    : Color(0xFF151515),
                              ]),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          shape: BoxShape.circle),
                      child: GestureDetector(
                        child: Icon(
                          LineAwesomeIcons.plus,
                          color: Colors.white,
                          size: 35.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              screenState,
              MenuBar()
            ],
          ),
        ),
      ),
    );
  }
}
