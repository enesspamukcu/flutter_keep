import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keep/pages/notes_page.dart';
import 'package:flutter_keep/pages/splash_screen.dart';

class RouteGenerator{
   static Route <dynamic>_createRoute(Widget gidilecekWidget){
       if (defaultTargetPlatform==TargetPlatform.iOS) {
        return CupertinoPageRoute(builder: (context)=>gidilecekWidget,);  
      }else if (defaultTargetPlatform==TargetPlatform.android) {
          return MaterialPageRoute(builder: (context)=>gidilecekWidget,); 
      }else{
        return CupertinoPageRoute(builder: (context)=>gidilecekWidget,); 
      }
    }

    static Route<dynamic>?routeGenerator(RouteSettings settings){
      switch (settings.name) {
        case '/firstscreen':
          return _createRoute(const SplashScreen());
        case('/homePage'):
          return _createRoute(NotesPage());
        default: 
          throw ('This route name does not exist');
      }
      
    }
}