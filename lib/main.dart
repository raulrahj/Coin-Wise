import 'package:coin_wise/database/profiledata.dart';
import 'package:coin_wise/screens/intro_screens/onboarding_screen.dart';
import 'package:coin_wise/screens/intro_screens/profile_screen.dart';
import 'package:coin_wise/screens/intro_screens/splash_screen.dart';
import 'package:coin_wise/screens/main_screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/database/category_db.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/models/transaction_model.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

GlobalKey<NavigatorState>?navigatorKey=GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(null, 
  [
    NotificationChannel(channelKey: 'key1', channelName: "Coin Wise", channelDescription: 'Coin Wise',
    playSound: true ,
    enableLights: true,
    )
  ]
  );
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(CategoryFieldAdapter().typeId)) {
    Hive.registerAdapter(CategoryFieldAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  if (!Hive.isAdapterRegistered(ProfileModelAdapter().typeId)) {
    Hive.registerAdapter(ProfileModelAdapter());
  }
  CategoryFunctions.instance.refreshUI();
  ProflieDb().refreshProfile();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  statusBarColor: defaultColor
  
));
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Coin Wise',
      theme:
      //  MyThemes.darkTheme,
       ThemeData(
        fontFamily: 'Antic',
        scaffoldBackgroundColor: primaryLight,
        primarySwatch: Colors.blueGrey,
        dialogBackgroundColor: defaultPrimaryColor,
        
      //  canvasColor: 
      ),
      home: SplashScreen(),
    );
  }
}
