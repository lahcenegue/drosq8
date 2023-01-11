import 'package:drosq8/Views/main_screens/home_screen.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("748d0bb2-8752-450a-ac1f-609c403e6282");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: ConstantManager.mainColor,
          titleTextStyle: GoogleFonts.amiri(
              textStyle: TextStyle(
            color: ConstantManager.textColor,
            fontSize: 28,
          )),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
