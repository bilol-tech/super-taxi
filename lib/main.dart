import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suppertaxi/Autorization/phoneNumber.dart';
import 'package:suppertaxi/Autorization/splashPage.dart';
import 'package:suppertaxi/driver/screens/drawer/tariffs.dart';
import 'package:suppertaxi/driver/screens/menu/driveToUser.dart';
import 'package:suppertaxi/driver/screens/menu/orders.dart';
import 'package:suppertaxi/user/screens/drawer/orderHistory.dart';
import 'package:suppertaxi/user/screens/menu/mainForMen.dart';

import 'driver/screens/menu/mainScreenDriver.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              title: 'Localization',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const SplashPage());
        });
  }
}
