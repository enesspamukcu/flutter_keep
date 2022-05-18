import 'package:flutter/material.dart';
import 'package:flutter_keep/models/theme_model.dart';
import 'package:flutter_keep/provider/theme_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Settingss extends StatelessWidget {
  const Settingss({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool darkModeCheck = themeProvider.hiveLocalStorage.fontStyleBox.getAt(0)!.lightMode;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Settings',style: themeProvider.themeControl(20,FontWeight.normal)),
      ),
      body: Center(
        child:ListView(
          children:  [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListTile(
                onTap: () async{
                showDialog(context: context, builder: (context){
                  return SimpleDialog(
                        title: Text('Font Styles',style: themeProvider.themeControl(18,FontWeight.normal)),
                        children: <Widget>[
                          SimpleDialogOption(
                            onPressed: () { },
                            child:ListTile(
                              title: Text('Open Sans',style: themeProvider.themeControl(16,FontWeight.normal)),
                              leading:  Radio(value: GoogleFonts.openSansTextTheme(), groupValue: themeProvider.choosedFont, onChanged: (newValue){
                                  themeProvider.putThemeModel(ThemeModel(fonttStyle: FonttStyle.opensans,lightMode:themeProvider.hiveLocalStorage.fontStyleBox.getAt(0)!.lightMode));
                            }),
                            )
                          ),
                          SimpleDialogOption(
                            onPressed: () {  },
                            child:ListTile(
                              title:  Text('Lato',style: themeProvider.themeControl(16,FontWeight.normal)),
                              leading:  Radio(value: GoogleFonts.latoTextTheme(), groupValue: themeProvider.choosedFont, onChanged: (newValue){
                                   themeProvider.putThemeModel(ThemeModel(fonttStyle: FonttStyle.lato,lightMode:themeProvider.hiveLocalStorage.fontStyleBox.getAt(0)!.lightMode));                                
                            }),
                            )
                          ),
                          SimpleDialogOption(
                            onPressed: () {  },
                            child:ListTile(
                              title:  Text('Felipa',style: themeProvider.themeControl(16,FontWeight.normal)),
                              leading:  Radio(value:GoogleFonts.felipaTextTheme(), groupValue: themeProvider.choosedFont, onChanged: (newValue){
                                   themeProvider.putThemeModel(ThemeModel(fonttStyle: FonttStyle.felipa,lightMode:themeProvider.hiveLocalStorage.fontStyleBox.getAt(0)!.lightMode));
                            }),
                            )
                          ),
                          SimpleDialogOption(
                          onPressed: () { },
                            child:ListTile(
                              title:  Text('Josefin Sans',style: themeProvider.themeControl(16,FontWeight.normal)),
                              leading:  Radio(value: GoogleFonts.josefinSansTextTheme(), groupValue: themeProvider.choosedFont ,onChanged: (newValue){
                                  themeProvider.putThemeModel(ThemeModel(fonttStyle: FonttStyle.josefin,lightMode:themeProvider.hiveLocalStorage.fontStyleBox.getAt(0)!.lightMode));
                            }),
                            )
                          ),
                        ],
                      );
               });
              },
                style: ListTileStyle.drawer,
                shape: Border.all(color:darkModeCheck==false ? Colors.grey: Colors.grey.shade600,width: 1.0),
                leading: const Icon(Icons.font_download),
                title:  Text('Font Family',style: themeProvider.themeControl(18,FontWeight.normal)),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListTile(
              style: ListTileStyle.drawer,
              shape: Border.all(color:darkModeCheck==false ? Colors.grey: Colors.grey.shade600,width: 1.0),
              leading: const Icon(Icons.sunny),
              title:Text('Night Mode',style: themeProvider.themeControl(18,FontWeight.normal)),
              trailing: Switch(
              value: themeProvider.hiveLocalStorage.fontStyleBox.getAt(0)!.lightMode,
              onChanged: (newValue) {
                  themeProvider.switchState(newValue);  
              },
              inactiveTrackColor: const Color.fromARGB(255, 37, 54, 148),
              inactiveThumbColor: Colors.black,
              activeColor: Colors.black,
              activeThumbImage: const AssetImage('assets/images/sun.png'),
              inactiveThumbImage: const AssetImage('assets/images/night4.png')),
          ),
            ),
          ],
        ) ,
      ),
    );
  }
}