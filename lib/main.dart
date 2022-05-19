import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:coin_wise/config/app_themes.dart';
import 'package:coin_wise/data/model/profiledata.dart';
import 'package:coin_wise/data/model/category_model.dart';
import 'package:coin_wise/data/model/transaction_model.dart';
import 'package:coin_wise/logic/cubit/theme/theme_cubit.dart';
import 'package:coin_wise/logic/cubit/config/config_cubit.dart';
import 'package:coin_wise/logic/bloc/category/category_bloc.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:coin_wise/screens/intro_screens/splash_screen.dart';
import 'package:coin_wise/logic/bloc/transactions/transactions_bloc.dart';
import 'package:coin_wise/logic/cubit/filter_transactions/filtertransaction_cubit.dart';

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
bool? dark;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'key1',
      channelName: "Coin Wise",
      channelDescription: 'Coin Wise',
      playSound: true,
      enableLights: true,
    )
  ]);
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
  // CategoryFunctions.instance.refreshUI();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // systemNavigationBarColor: Colors.transparent
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionsBloc>(
          
          create: (BuildContext context) => TransactionsBloc(),
        ),
        BlocProvider<ThemeCubit>(
          create: (BuildContext  context) => ThemeCubit()
        ),
        BlocProvider<CategoryBloc>(
          create: (BuildContext context)=> CategoryBloc()),
          BlocProvider<FiltertransactionCubit>(
            create: ((context) => FiltertransactionCubit())),
            BlocProvider(
              create: ( (context) => ConfigCubit()))
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        // dark = themeNotifier.isDark;
        return
      //  child:
         MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Coin Wise',
          theme:
          // MyThemes.darkTheme,
          state.isDark ? MyThemes.darkTheme : MyThemes.lightTheme,
          home: const SplashScreen(),
        );
      }),
    );
  }
}
