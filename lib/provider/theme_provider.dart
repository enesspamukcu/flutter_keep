import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_keep/database/local_storage.dart';
import 'package:flutter_keep/models/theme_model.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier{
  HiveLocalStorage hiveLocalStorage = HiveLocalStorage();
  late TextTheme choosedFont;

  void fontControl(){
    if(hiveLocalStorage.fontStyleBox.isEmpty){
      hiveLocalStorage.fontStyleBox.add(ThemeModel(fonttStyle: FonttStyle.opensans,lightMode:true));
    }
  }

  TextTheme changeFont(){
    fontControl();
    if (hiveLocalStorage.fontStyleBox.getAt(0)?.fonttStyle==FonttStyle.opensans) {
      choosedFont=GoogleFonts.openSansTextTheme();
      return GoogleFonts.openSansTextTheme().copyWith(
        headline6:themeControl(21, FontWeight.normal)
      );
    }else if (hiveLocalStorage.fontStyleBox.getAt(0)!.fonttStyle==FonttStyle.lato) {
      choosedFont=GoogleFonts.latoTextTheme();
      return GoogleFonts.latoTextTheme().copyWith(
        headline6:themeControl(21, FontWeight.normal)
      );
    }else if (hiveLocalStorage.fontStyleBox.getAt(0)!.fonttStyle==FonttStyle.felipa) {
      choosedFont=GoogleFonts.felipaTextTheme();
     return GoogleFonts.felipaTextTheme().copyWith(
       headline6: themeControl(21, FontWeight.normal)
     );
    }
    else{
      choosedFont=GoogleFonts.josefinSansTextTheme();
      return GoogleFonts.josefinSansTextTheme().copyWith(
        headline6: themeControl(21, FontWeight.normal),
      );
    }
  }

  TextStyle themeControl(double fontsize,FontWeight fontWeight){
     if (hiveLocalStorage.fontStyleBox.getAt(0)?.fonttStyle==FonttStyle.opensans) {
      return GoogleFonts.openSans(fontWeight:fontWeight ,fontSize: fontsize,color: hiveLocalStorage.fontStyleBox.getAt(0)!.lightMode==false?Colors.white:Colors.black);
    }else if (hiveLocalStorage.fontStyleBox.getAt(0)!.fonttStyle==FonttStyle.lato) {
      return GoogleFonts.lato(fontWeight:fontWeight ,fontSize: fontsize,color: hiveLocalStorage.fontStyleBox.getAt(0)!.lightMode==false?Colors.white:Colors.black);
    }else if (hiveLocalStorage.fontStyleBox.getAt(0)!.fonttStyle==FonttStyle.felipa) {
     return GoogleFonts.felipa(fontWeight:fontWeight ,fontSize: fontsize,color: hiveLocalStorage.fontStyleBox.getAt(0)!.lightMode==false?Colors.white:Colors.black);
    }
    else{
      return GoogleFonts.josefinSans(fontWeight:fontWeight ,fontSize: fontsize,color: hiveLocalStorage.fontStyleBox.getAt(0)!.lightMode==false?Colors.white:Colors.black);
    }
  }
  
  void addFont(FonttStyle fonttStyle){
    hiveLocalStorage.addThemeModel(fontStyleModel:ThemeModel(fonttStyle:fonttStyle,lightMode: hiveLocalStorage.fontStyleBox.getAt(0)!.lightMode));
    notifyListeners();
  }

  void putThemeModel(ThemeModel fontStyleModel){
    hiveLocalStorage.putThemeModel(fontStyleModel: fontStyleModel);
    notifyListeners();
  }

  void switchState(bool state){
     hiveLocalStorage.fontStyleBox.getAt(0)!.lightMode=state;
     hiveLocalStorage.putThemeModel(fontStyleModel: ThemeModel(fonttStyle: hiveLocalStorage.fontStyleBox.getAt(0)!.fonttStyle, lightMode: state));
     notifyListeners();
    }
  }
