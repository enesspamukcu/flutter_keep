import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keep/constants.dart';
import 'package:flutter_keep/models/theme_model.dart';
import 'package:flutter_keep/models/note.dart';
import 'package:flutter_keep/pages/splash_screen.dart';
import 'package:flutter_keep/provider/note_view_model.dart';
import 'package:flutter_keep/provider/theme_provider.dart';
import 'package:flutter_keep/route/route_generator.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(ThemeModelAdapter());
  Hive.registerAdapter(FonttStyleAdapter());
  await Hive.openBox<Note>('notx');
  await Hive.openBox<ThemeModel>('fonty');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => NoteViewModel()),
    ChangeNotifierProvider(
      create: (context) => ThemeProvider())
  ],
  child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    themeProvider.fontControl();
    return MaterialApp(
      onGenerateRoute: RouteGenerator.routeGenerator,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Keep',
      theme: themeProvider.hiveLocalStorage.fontStyleBox.getAt(0)!.lightMode == false
          ? ThemeData.dark().copyWith(
            textTheme: themeProvider.changeFont(),
              appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.light,
                      statusBarColor: Colors.transparent.withOpacity(0.05)),
                  color: Constants.darkModeBackgrounColor),
              scaffoldBackgroundColor: Constants.darkModeBackgrounColor)
          : ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.white,
            textTheme: themeProvider.changeFont(),
              appBarTheme:  AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.dark,
                      statusBarColor: Colors.transparent.withOpacity(0.05)),
                  color: Colors.white,
                  iconTheme:const IconThemeData(color: Colors.black))),
      home: const SplashScreen(),
    );
  }
}
