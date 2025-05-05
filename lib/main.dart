// ignore_for_file: avoid_print

import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/config/theme_data.dart';
import 'package:oxygen_loans/providers/theme.dart';
import 'package:oxygen_loans/screens/splash_screen/splash_screen.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  OxygenApp.sharedPreferences = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Only allow portrait orientation
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) =>
            Sizer(builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            navigatorKey: GlobalContextService.navigatorKey,
            title: 'O2 Finance',
            debugShowCheckedModeBanner: false,
            theme: AppThemes.appThemeData,
            home: SplashScreen(),
          );
        }),
      ),
    );
  }
}



//may 15

