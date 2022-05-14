import 'package:flutter/material.dart';
import 'package:flutter_keep/pages/archived_notes.dart';
import 'package:flutter_keep/pages/settings.dart';
import 'package:flutter_keep/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final lightTheme = themeProvider.hiveLocalStorage.fontStyleBox.getAt(0)!.lightMode;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
           SizedBox(height: MediaQuery.of(context).size.height*0.05),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              children:[
                Image.asset('assets/images/notebook.png',width:MediaQuery.of(context).size.width*0.18,height:MediaQuery.of(context).size.height*0.11,fit: BoxFit.fitHeight,),
                const SizedBox(width: 10,),
                Text('Keep My Notes',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: lightTheme==false?Colors.white:Colors.black)),
              ],
            ),
          ),
           const Divider(color: Colors.grey,thickness: 1.0),
           ListTile(
            onTap: () {
              Navigator.popAndPushNamed(context,'/homePage');
            },
            leading: const Icon(Icons.note),
            title:  Text('Notes',style: themeProvider.themeControl(18,FontWeight.normal),),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchivedNotes())),
            leading: const Icon(Icons.archive),
            title:  Text('Archive',style:themeProvider.themeControl(18,FontWeight.normal) ),
          ),
          const Divider(color: Colors.grey,thickness: 1.0),
           ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const Settingss())),
            leading:const Icon(Icons.settings),
            title:  Text('Settings',style: themeProvider.themeControl(18,FontWeight.normal)),
          ),
           ListTile(
            leading: const Icon(Icons.share),
            title:  Text('Share',style: themeProvider.themeControl(18,FontWeight.normal)),
          ),
            ListTile(
            leading: const Icon(Icons.privacy_tip),
            title:  Text('Privacy Policy',style: themeProvider.themeControl(18,FontWeight.normal)),
          ),
        ],
      ),
    );
  }
}