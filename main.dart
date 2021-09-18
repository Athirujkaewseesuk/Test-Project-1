import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'; //vvv Package
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '1_Main/HomePanal.dart';
import 'f_Widget/Model.dart';
import 'f_Widget/Provider.dart';
import 'f_Widget/Sizconfig.dart';
import 'f_Widget/Theme_app.dart'; //vvv Widget

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
            return MaterialApp(
              themeMode: themeProvider.themeMode,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              home: SplashScreen(),
            );
          });
}

User user = FirebaseAuth.instance.currentUser;
var userProfile = FirebaseAuth.instance.currentUser.photoURL;
var userName = FirebaseAuth.instance.currentUser.displayName;
var userEmail = FirebaseAuth.instance.currentUser.email;
var userUid = FirebaseAuth.instance.currentUser.uid;


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
String screenMode;
String statusScreen;
class _SplashScreenState extends State<SplashScreen> {

  modeScreen() async {
    if (MediaQueryData.fromWindow(window).size.width <= 800 && MediaQueryData.fromWindow(window).size.height <= 800) {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp
      ]);
      setState(() {
        screenMode = 'Portrait';
        print(screenMode);
      });
    } else {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight
      ]);
      setState(() {
        screenMode = 'Landscape';
        print(screenMode);
      });
    }
   await switchScreen();

  }

  switchScreen() async {
    portraitScreen() async{
      await portraitSize();
    }
    landscapeScreen() async{
      await landscapeSize();


    }
    switch (screenMode) {
      case 'Portrait':
        Timer(Duration(seconds: 8),(){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePanal()),
          );}

        );
        print('this is Portrait');
        statusScreen = 'Welcome. . . .(P)';
        await portraitScreen();
        print('switch ' + MainConfig.screenWidth.toString());
        print('switch ' + MainConfig.screenHeight.toString());
        break;
      case 'Landscape':
        Timer(Duration(seconds: 8),(){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePanal()),
          );}

        );
        print('this is Landscape');
        statusScreen = 'Welcome. . . .(L)';
        await landscapeScreen();
        print('switch ' + MainConfig.screenWidth.toString());
        print('switch ' + MainConfig.screenHeight.toString());

        break;
      default:
        print('Error something IDK');
    }

  }

  @override
  void initState() {
    super.initState();
    displaySizeCalculation();
    modeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DelayedDisplay(
      delay: Duration(milliseconds: 300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Logo(),
          SizedBox(height: 20,)]
      ),
    ));
  }
}

void displaySizeCalculation() {
  print('width :' +
      MediaQueryData.fromWindow(window).size.width.toString() +
      ', 100% of screenWidth');
  print('height :' +
      MediaQueryData.fromWindow(window).size.height.toString() +
      ', 100% of screenHeight');
  print('safeArea :' +
      MediaQueryData.fromWindow(window).padding.top.toString() +
      ', 100% of safeArea');
}

class Logo extends StatefulWidget {
  const Logo({Key key}) : super(key: key);

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;
  Animation<double> _sizeAnimation;
  Animation<double> sizeAnimated;
  AnimationController _sizeAnimationController;

  @override
  void initState() {
    _sizeAnimationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _sizeAnimation = CurvedAnimation(
      parent: _sizeAnimationController,
      curve: Curves.easeInOutCirc,
    );

    sizeAnimated = Tween<double>(
      begin: height * 1,
      end: height * 30,
    ).animate(_sizeAnimation);

    _animationController = AnimationController(
      duration: const Duration(
        seconds: 5,
      ),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutQuint,
    );

    animation();
    super.initState();
  }

  animation() {
    Future.delayed(Duration(milliseconds: 1500)).then((value) {
      _sizeAnimationController.forward();
    });
    Future.delayed(Duration(milliseconds: 200))
        .then((value) => AssetsAudioPlayer.newPlayer().open(
              Audio("iassets/logo1.mp3"),
            ));
    Future.delayed(Duration(milliseconds: 5000))
        .then((value) => AssetsAudioPlayer.newPlayer().open(
              Audio("iassets/logo2.mp3"),
            ));
    Future.delayed(Duration(seconds: 5))
        .then((value) => _animationController.forward());
    Future.delayed(Duration(seconds: 10))
        .then((value) => AssetsAudioPlayer.newPlayer().stop());
  }

  @override
  void dispose() {
    _animationController.dispose();
    _sizeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Decoration containerDecoration = BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
              color:
                  !themeProvider.isDarkMode ? Colors.white : Color(0xFF696969),
              offset: !themeProvider.isDarkMode
                  ? Offset(-2.0, -2.0)
                  : Offset(-2.0, -2.0),
              blurRadius: !themeProvider.isDarkMode ? 5.0 : 5.0,
              spreadRadius: !themeProvider.isDarkMode ? 1.0 : 0.1),
          BoxShadow(
              color: !themeProvider.isDarkMode
                  ? Colors.grey[350]
                  : Color(0xFF151515),
              offset: !themeProvider.isDarkMode
                  ? Offset(2.0, 2.0)
                  : Offset(2.0, 2.0),
              blurRadius: !themeProvider.isDarkMode ? 5.0 : 5.0,
              spreadRadius: !themeProvider.isDarkMode ? 1.0 : 1),
        ]);
    return Center(
      child: Container(
        height: height * 30 / 2,
        width: height * 30,
        child: Center(
          child: AnimatedBuilder(
              animation: _sizeAnimationController,
              builder: (context, child) => Container(
                    height: sizeAnimated.value / 2,
                    width: sizeAnimated.value,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                                height: 100,
                                width: 100,
                                decoration: containerDecoration,
                                child: Center(child: LogoImage())),
                          ),
                          RotationTransition(
                            turns: Tween<double>(begin: 0.0, end: pi / 2.515)
                                .animate(_animation),
                            child: Text(
                              'HI',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
