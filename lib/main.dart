import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kanallartv_flutter/channels/screens/channels_screen.dart';
import 'package:kanallartv_flutter/splash/splash_page.dart';
import 'package:provider/provider.dart';

import 'calculator/imports.dart';
import 'calculator/model/historyitem.dart';
import 'calculator/provider/calculator_provider.dart';
import 'calculator/screens/calculator.dart';
import 'calculator/screens/history.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HistoryItemAdapter());
  await Hive.openBox<HistoryItem>('history');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorProvider>(
      create: (_) => CalculatorProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: AppBarTheme(
            color: backgroundColor,
            elevation: 0.0,
          ),
          textTheme: TextTheme(
            headline3: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            caption: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
              fontSize: 18.0,
            ),
          ),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: yellowColor),
        ),
        routes: {
          '/': (context) => SplashPage(),
          '/channels-screen': (context) => ChannelsScreen(),
          //calculator
          '/calculator': (context) => Calculator(),
          '/history': (context) => History(),
        },
      ),
    );
  }
}
