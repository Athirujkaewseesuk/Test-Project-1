import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitri_official/f_Widget/Model.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'a_device.dart';
import 'b_team.dart';
import 'c_family.dart';
import 'd_class.dart';

String page = 'devices';
int selectedHomeMenuItem = 0;
Widget homeScreenState = Device();
final List<String> homeMenuText = [
  'devices',
  'team mode',
  'family mode',
  'classroom mode',

];
final List<IconData> homeMenuIcons = [
  LineAwesomeIcons.atom,
  LineAwesomeIcons.users,
  LineAwesomeIcons.campground,
  LineAwesomeIcons.chalkboard_teacher,
];
void setHomePageTitle() {
  switch (selectedHomeMenuItem) {
    case 0:
      page = "device";
      print(page);
      homeScreenState = Device();
      break;
    case 1:
      page = "team mode";
      print(page);
      homeScreenState = Team();
      break;
    case 2:
      page = "family mode";
      print(page);
      homeScreenState = Family();
      break;
    case 3:
      page = "classroom mode";
      print(page);
      homeScreenState = Classroom();
      break;
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              toolbarHeight: 100.h,
              actions: [
                ActionMenuItem(
                  actionMenuIcons: actionMenuIcons[0],
                  actionMenuText: actionMenuText[0],
                  actionMenuPage: actionMenuPage[0],
                ),
                ActionMenuItemCount(
                  actionMenuIcons: actionMenuIcons[1],
                  actionMenuText: actionMenuText[1],
                  actionMenuPage: actionMenuPage[1],
                ),
              ],
              bottom: PreferredSize(
                preferredSize: null,
                child: Container(
                  height: 50.h,
                  width: homeMenuIcons.length*50.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeMenuIcons.length,
                    itemBuilder: (context, index) =>
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedHomeMenuItem = index;
                              page = homeMenuText[index];
                              setHomePageTitle();
                            });
                          },
                          child: HomeMenuItem(
                            homeMenuIcons: homeMenuIcons[index],
                            position: index,
                            selected: selectedHomeMenuItem,
                          ),
                        ),

                  ),
                ),
              ),
            ),
            body: homeScreenState
        ),
      ),
    );
  }
}


// class MenuBar extends StatefulWidget {
//   const MenuBar({Key key}) : super(key: key);
//
//   @override
//   _MenuBarState createState() => _MenuBarState();
// }
// class _MenuBarState extends State<MenuBar> with TickerProviderStateMixin<MenuBar> {
//   int selectedMenuItem = 0;
//   String pageTitle = "homepage";
//
//   @override
//   void initState() {
//     aanimationController =
//         AnimationController(vsync: this, duration: animationDuration);
//     isSidebarOpenedStreamController = PublishSubject<bool>();
//     isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
//     isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
//
//     panimationController = AnimationController(vsync: this, duration: animationDuration);
//     isProfileOpenedStreamController = PublishSubject<bool>();
//     isProfileOpenedStream = isProfileOpenedStreamController.stream;
//     isProfileOpenedSink = isProfileOpenedStreamController.sink;
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     aanimationController.dispose();
//     isSidebarOpenedStreamController.close();
//     isSidebarOpenedSink.close();
//     super.dispose();
//   }
//   final List<String> menuItems = [
//     "home",
//     "store",
//     "my friends",
//     "theme",
//     "language",
//     "documents",
//     "about Hi-tri",
//   ];
//   final List<Widget> menuIcons = [
//     Icon(LineAwesomeIcons.home, size: 40.sp, color: AppTheme.Red),
//     Icon(LineAwesomeIcons.shopping_bag, size: 40.sp, color: AppTheme.Blue),
//     Icon(LineAwesomeIcons.user_friends, size: 40.sp, color: AppTheme.Orange),
//     Icon(LineAwesomeIcons.paint_roller, size: 40.sp, color: AppTheme.Red),
//     Icon(LineAwesomeIcons.home, size: 40.sp, color: AppTheme.Red),
//     Icon(LineAwesomeIcons.info_circle, size: 40.sp, color: AppTheme.Orange),
//     Image(
//         height: 40.sp,
//         width: 40.sp,
//         image: AssetImage('images/Hi-Tri_Logo3.png')),
//   ];
//
//   void setPageTitle() {
//     switch (selectedMenuItem) {
//       case 0:
//         pageTitle = "homepage";
//         print(pageTitle);
//         break;
//       case 1:
//         pageTitle = "store";
//         print(pageTitle);
//         break;
//       case 2:
//         pageTitle = "my friends";
//         print(pageTitle);
//         break;
//       case 3:
//         pageTitle = "theme";
//         print(pageTitle);
//         break;
//       case 4:
//         pageTitle = "language";
//         print(pageTitle);
//         break;
//       case 5:
//         pageTitle = "documents";
//         print(pageTitle);
//         break;
//       case 6:
//         pageTitle = "about Hi-tri";
//         print(pageTitle);
//         break;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     Decoration containerDecoration = BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(20)),
//         color: Theme.of(context).scaffoldBackgroundColor,
//         boxShadow: [
//           BoxShadow(
//               color:
//                   !themeProvider.isDarkMode ? Colors.white : Color(0xFF696969),
//               offset: !themeProvider.isDarkMode
//                   ? Offset(-2.0, -2.0)
//                   : Offset(-2.0, -2.0),
//               blurRadius: !themeProvider.isDarkMode ? 5.0 : 5.0,
//               spreadRadius: !themeProvider.isDarkMode ? 1.0 : 0.1),
//           BoxShadow(
//               color: !themeProvider.isDarkMode
//                   ? Colors.grey[350]
//                   : Color(0xFF151515),
//               offset: !themeProvider.isDarkMode
//                   ? Offset(2.0, 2.0)
//                   : Offset(2.0, 2.0),
//               blurRadius: !themeProvider.isDarkMode ? 5.0 : 5.0,
//               spreadRadius: !themeProvider.isDarkMode ? 1.0 : 1),
//         ]);
//     Decoration tabBarDecoration = BoxDecoration(
//         borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),
//         color: Theme.of(context).scaffoldBackgroundColor,
//         boxShadow: [
//           BoxShadow(
//               color: !themeProvider.isDarkMode
//                   ? Color(0xFFD6D6D6)
//                   : Color(0xFF151515),
//               offset: !themeProvider.isDarkMode
//                   ? Offset(2.0, 0)
//                   : Offset(2.0, 0),
//               blurRadius: !themeProvider.isDarkMode ? 15.0 : 15.0,
//               spreadRadius: !themeProvider.isDarkMode ? 1.0 : 1),
//         ]);
//     Decoration avatarDecoration = BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(20)),
//         color: Theme.of(context).scaffoldBackgroundColor,
//         boxShadow: [
//           BoxShadow(
//               color:
//                   !themeProvider.isDarkMode ? Colors.white : Color(0xFF696969),
//               offset: !themeProvider.isDarkMode
//                   ? Offset(-2.0, -2.0)
//                   : Offset(-2.0, -2.0),
//               blurRadius: !themeProvider.isDarkMode ? 5.0 : 5.0,
//               spreadRadius: !themeProvider.isDarkMode ? 1.0 : 0.1),
//           BoxShadow(
//               color: !themeProvider.isDarkMode
//                   ? Colors.grey[350]
//                   : Color(0xFF151515),
//               offset: !themeProvider.isDarkMode
//                   ? Offset(2.0, 2.0)
//                   : Offset(2.0, 2.0),
//               blurRadius: !themeProvider.isDarkMode ? 5.0 : 5.0,
//               spreadRadius: !themeProvider.isDarkMode ? 1.0 : 1),
//         ]);
//     ScreenUtil.init(
//       BoxConstraints(
//           maxWidth: MediaQuery.of(context).size.width,
//           maxHeight: MediaQuery.of(context).size.height),
//       designSize: Size(MainConfig.screenWidth, MainConfig.screenHeight),
//     );
//     return Stack(children: [
//
//       StreamBuilder<bool>(
//           initialData: false,
//           stream: isSidebarOpenedStream,
//           builder: (context, isSideBarOpenedAsync) {
//             return Stack(
//               children: [
//                 AnimatedPositioned(
//                   top: MainConfig.sidebarPositionTop.h,
//                   bottom: MainConfig.sidebarPositionBottom.h,
//                   right: !isSideBarOpenedAsync.data
//                       ? ScreenUtil().screenWidth
//                       : MainConfig.sidebarPositionRight.w,
//                   left: !isSideBarOpenedAsync.data
//                       ? -MainConfig.sidebarPositionRight.w
//                       : MainConfig.sidebarPositionLeft.w,
//                   duration: Duration(milliseconds: 500),
//                   curve: Curves.easeInOutExpo,
//                   child: Container(
//                     height: MainConfig.sideBarHeight.h,
//                     width: MainConfig.sideBarWidth.w,
//                     child: StreamBuilder<bool>(
//                         initialData: false,
//                         stream: isProfileOpenedStream,
//                         builder: (context, isProfileOpenedAsync) {
//                       return Stack(
//                         alignment: Alignment.center,
//                         children: [
//
//                           AnimatedPositioned( //profile
//                             top:MainConfig.sideBarProfilePositionTop.h,
//                             bottom: !isProfileOpenedAsync.data ? MainConfig.sideBarProfilePositionBottom.h : MainConfig.sideBarMenuPositionBottom.h,
//                             duration: Duration(milliseconds: 500),
//                             curve: Curves.easeInOutExpo,
//                             child: Container(
//                               height: MainConfig.sideBarProfileHeight.h,
//                               width: MainConfig.sideBarProfileWidth.w,
//                               child: Stack(
//                                 children: [
//                                   AnimatedPositioned( //profile
//                                     top: MainConfig.boxProfileImageRadian.r,
//                                     bottom: 0,
//                                     duration: Duration(milliseconds: 500),
//                                     curve: Curves.easeInOutExpo,
//                                     child: Container(
//                                       height: MainConfig.boxProfileHeight.h,
//                                       width: MainConfig.boxProfileWidth.w,
//                                       decoration: containerDecoration,
//                                       child: (user != null)
//                                           ? Stack(
//                                         children: [
//                                           Align(
//                                             alignment: Alignment.topRight,
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(8.0),
//                                               child: Container(
//                                                 height: MainConfig.boxProfileStatusHeight.h,
//                                                 width: MainConfig.boxProfileStatusWidth.w,
//                                                 child: Row(
//                                                   children: [
//                                                     Container(
//                                                       height: MainConfig.boxProfileStatusRadian.r,
//                                                       width: MainConfig.boxProfileStatusRadian.r,
//                                                       decoration: BoxDecoration(
//                                                         shape: BoxShape.circle,
//                                                         color: Colors.green
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       width: MainConfig.boxProfileStatusPadding.w,
//                                                     ),
//                                                     Icon(
//                                                       LineAwesomeIcons.signal,
//                                                       size: MainConfig.boxProfileStatusIconSize.sp,
//                                                       color: Color(0xFF7D7D7D),
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Align(
//                                             alignment: Alignment.bottomRight,
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(10.0),
//                                               child: IconButton(
//                                                 onPressed: (){
//                                                   onProfileIconPressed();
//                                                 },
//                                                 icon: Icon(
//                                                   LineAwesomeIcons.pen,
//                                                   size: MainConfig.boxProfilePenIconSize.sp,
//                                                   color: Color(0xFF7D7D7D),
//                                                 ),
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       )
//                                           : Column(
//                                         mainAxisAlignment: MainAxisAlignment.end,
//                                         crossAxisAlignment: CrossAxisAlignment.end,
//                                         children: [
//                                           Container(
//                                             child: GestureDetector(
//                                               onTap: (){
//                                                 Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(builder: (context) => SignIn()),
//                                                 );
//                                               },
//                                               child: Padding(
//                                                 padding: const EdgeInsets.all(10.0),
//                                                 child: Container(
//                                                   decoration: BoxDecoration(
//                                                     border: Border.all(color: AppTheme.Blue,width: 2),
//                                                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                                                   ),
//                                                   height: MainConfig.boxProfileSignInHeight.h,
//                                                   width: MainConfig.boxProfileSignInWidth.w,
//                                                   child: Center(
//                                                     child: Text(
//                                                       'sign in',
//                                                       style: GoogleFonts.nunito(
//                                                           fontSize:  16,
//                                                           color: AppTheme.Blue,
//                                                           fontWeight: FontWeight.w600),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Align(
//                                     alignment:
//                                         MainConfig.boxProfileImageAlignment,
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                           height: MainConfig.boxProfileImageRadian.r*2,
//                                           width: MainConfig.boxProfileImageRadian.r*2,
//                                           decoration: avatarDecoration,
//                                           child: (user != null &&
//                                                 userProfile !=
//                                                     null)
//                                                 ?  ClipRRect(
//                                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                                                   child: Image (
//                                               image:NetworkImage(FirebaseAuth
//                                                     .instance.currentUser.photoURL,
//                                               ),fit: BoxFit.fill,
//                                           ),
//                                                 )
//                                                 :  Padding(
//                                                   padding: const EdgeInsets.all(8.0),
//                                                   child: Image(image:AssetImage('images/Person.png',)),
//                                                 ),
//                                           ),
//                                         (user != null) ? Container(
//                                           child: Column(
//                                         children:[
//                                               SizedBox(
//                                           height: MainConfig.boxMenuPaddingVertical,
//                                         ),
//                                         Text((user != null) ?
//                                         userName : '-',style: Theme.of(context).textTheme.bodyText2,),
//                                         Text((user != null) ?
//                                         userEmail : '-',style: Theme.of(context).textTheme.subtitle1,)
//                                           ]))
//                                       : Container()
//                                       ],
//                                     ),
//                                     ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//
//                           AnimatedPositioned( //menu
//                             top: !isProfileOpenedAsync.data ? MainConfig.sideBarMenuPositionTop.h : ScreenUtil().screenHeight,
//                             bottom: !isProfileOpenedAsync.data ? MainConfig.sideBarMenuPositionBottom.h : -MainConfig.sideBarMenuPositionTop.h,
//                             duration: Duration(milliseconds: 500),
//                             curve: Curves.easeInOutExpo,
//                             child: Container(
//                               height: MainConfig.boxBarMenuHeight.h,
//                               width: MainConfig.boxBarMenuWidth.w,
//                               decoration: containerDecoration,
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     height: MainConfig.boxMenuHeight.h,
//                                     width: MainConfig.boxBarMenuWidth.w,
//                                     child: Center(
//                                       child: Text(
//                                         'Menu',
//                                         style: GoogleFonts.nunito(
//                                             fontSize:  fontsize*2.8,
//                                             color: AppTheme.Orange,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                       width: MainConfig.boxMenuWidth.w,
//                                       child: ListView.builder(
//                                         scrollDirection: Axis.vertical,
//                                           itemCount: menuItems.length,
//                                           itemBuilder: (context, index) =>
//                                               Column(
//                                                 children: [
//                                                   GestureDetector(
//                                                     onTap: () {
//                                                       setState(() {
//                                                         selectedMenuItem = index;
//                                                         setPageTitle();
//                                                       });
//
//                                                     },
//                                                     child: MenuItem(
//                                                       height: MainConfig.boxMenuHeight.h,
//                                                       width: MainConfig.boxMenuWidth.w,
//                                                       itemIcon: menuIcons[index],
//                                                       itemText: menuItems[index],
//                                                       selected: selectedMenuItem,
//                                                       position: index,
//                                                     ),
//                                                   ),
//                                                   SizedBox(
//                                                     height: MainConfig.boxMenuPaddingVertical.h,
//                                                   ),
//                                                 ],
//                                               )),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                         }
//                         ),
//                     ),
//                   ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                     height: MainConfig.tabBarHeight.h,
//                     width: MainConfig.tabBarWidth.w,
//                     decoration: tabBarDecoration,
//                     child: Stack(
//                         children: [
//                           Align(
//                             alignment: MainConfig.tabBarMenuIconAlignment,
//                             child: Container(
//                               width: MainConfig.tabBarMenuIconSize.sp+ (MainConfig.tabBarMenuIconPadding.sp*2),
//                               child: Center(
//                                 child: IconButton(
//                                   onPressed: () => onIconPressed(),
//                                   icon: AnimatedIcon(
//                                     progress: aanimationController.view,
//                                     icon: AnimatedIcons.menu_close,
//                                     size: MainConfig.tabBarMenuIconSize.sp,
//                                     color: !themeProvider.isDarkMode
//                                         ? Color(0xFFADACAC)
//                                         : Color(0xFF151515),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Align(
//                             alignment: MainConfig.tabBarPlusIconAlignment,
//                             child: Container(
//                               width: MainConfig.tabBarMenuIconSize.sp+ (MainConfig.tabBarPlusIconPadding.sp*2),
//                               child: Center(
//                                 child: Icon(
//                                   LineAwesomeIcons.plus,
//                                   size: MainConfig.tabBarPlusIconSize.sp,
//                                   color: !themeProvider.isDarkMode
//                                       ? Color(0xFFADACAC)
//                                       : Color(0xFF151515),
//                                 ),
//                               ),
//                             ),
//                           )
//                         ]
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           }),
//     ]);
//   }
// }

// class MenuItem extends StatelessWidget {
//   final String itemText;
//   final Widget itemIcon;
//   final int selected;
//   final int position;
//   final double height;
//   final double width;
//
//   MenuItem({this.itemText, this.itemIcon, this.selected, this.position, this.height, this.width});
//
//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(
//       BoxConstraints(
//           maxWidth: MediaQuery.of(context).size.width,
//           maxHeight: MediaQuery.of(context).size.height),
//       designSize: Size(MainConfig.screenWidth, MainConfig.screenHeight),
//     );
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 300),
//       height: height,
//       width: width,
//       decoration: BoxDecoration(
//         color: selected == position ? Color(0xFFFFFFFF) : Theme.of(context).scaffoldBackgroundColor,
//         borderRadius: BorderRadius.all(Radius.circular(15)),
//
//       ),
//       child: Row(
//         children: <Widget>[
//           SizedBox(
//             width: MainConfig.boxMenuPaddingVertical.w,
//           ),
//           Container(
//               height: MainConfig.boxMenuIconHeight.h,
//               width: MainConfig.boxMenuIconHeight.h,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).scaffoldBackgroundColor,
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//               ),
//
//               child: Center(
//                   child: itemIcon)),
//           SizedBox(
//             width: MainConfig.boxMenuPaddingHorizon.w,
//           ),
//           Container(
//             child: Center(
//               child: Text(
//                 itemText,
//                 style: Theme.of(context).textTheme.bodyText1,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }