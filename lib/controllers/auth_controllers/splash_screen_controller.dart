import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:oxygen_loans/bottom_nav_layout.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/models/notifcation_badge.dart';
import 'package:oxygen_loans/models/push_notifications_model.dart';
import 'package:oxygen_loans/screens/auth/login.dart';
import 'package:oxygen_loans/screens/auth/pin_check.dart';
import 'package:oxygen_loans/screens/auth/register2.dart';
import 'package:oxygen_loans/screens/auth/verify_eamil.dart';
import 'package:oxygen_loans/screens/onboarding/body.dart';

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class SplashScreenController extends GetxController {
  late final FirebaseMessaging _messaging;
  PushNotification? _notificationInfo;
  late int _totalNotifications;

  @override
  void onInit() {
    super.onInit();
    checkForInitialMessage();
    registerNotification();
    displaySpash();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );
      print("recived");
    });
  }

  displaySpash() async {
    Timer(Duration(seconds: 4), () async {
      //await OxygenApp.sharedPreferences!.setString(OxygenApp.userAvatarUrl, "");
      // await OxygenApp.sharedPreferences!
      //     .setBool(OxygenApp.isCompleteProfile, false);
      print(OxygenApp.sharedPreferences!.getString(OxygenApp.fcmToken));
      bool firstRun = await IsFirstRun.isFirstRun();
      if (firstRun) {
        print("firstrun");
        // OxygenApp.auth!.signOut().then((value) {
        //   Get.off(() => Onbording(),
        //       duration: const Duration(seconds: 2),
        //       transition: Transition.circularReveal);
        // });
        await OxygenApp.sharedPreferences!
            .setBool(OxygenApp.permissionGiven, false);
        await OxygenApp.sharedPreferences!
            .setBool(OxygenApp.isCompleteProfile, false);
        await OxygenApp.sharedPreferences!
            .setString(OxygenApp.isLoanActive, "0");
        await OxygenApp.sharedPreferences!
            .setString(OxygenApp.familyRelationship1, "Please select");

        await OxygenApp.sharedPreferences!
            .setString(OxygenApp.familyRelationship2, "Please select");

        await OxygenApp.sharedPreferences!.setString(OxygenApp.version, "1");
        Get.offAll(() => Onbording(),
            duration: const Duration(milliseconds: 1000),
            transition: Transition.rightToLeft);
      } else {
        bool isLoggedIn =
            OxygenApp.sharedPreferences!.getBool(OxygenApp.isLoggedIn) ?? false;
        if (isLoggedIn) {
          Get.offAll(() => MainScreen(sIndex: 0),
              duration: const Duration(milliseconds: 1000),
              transition: Transition.rightToLeft);
        } else {
          Get.offAll(() => Login(),
              duration: const Duration(milliseconds: 1000),
              transition: Transition.rightToLeft);
        }
      }
    });
  }

  void registerNotification() async {
    String? androidToken = await FirebaseMessaging.instance.getToken();
    print(androidToken);
    // 2. Instantiate Firebase Messaging
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      // TODO: handle the received notifications
    } else {
      print('User declined or has not accepted permission');
    }

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      // For handling the received notifications
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // Parse the message received
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
        );

        print(message.notification?.title);
        print(message.notification?.body);
        print(message.notification?.title);
        print(message.notification?.body);
        /*
        setState(() {
          _notificationInfo = notification;
          _totalNotifications++;
        });
        */
      });
    } else {
      print('User declined or has not accepted permission');
    }

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // ...
        if (_notificationInfo != null) {
          // For displaying the notification as an overlay
          showSimpleNotification(
            Text(_notificationInfo!.title!),
            leading: NotificationBadge(totalNotifications: _totalNotifications),
            subtitle: Text(_notificationInfo!.body!),
            background: Colors.cyan.shade700,
            duration: Duration(seconds: 2),
          );
          // print(_notificationInfo!.title!);
          // print(_notificationInfo!.body!);
        }
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      PushNotification notification = PushNotification(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
      );

      /*
      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
      */
    }
  }
}
