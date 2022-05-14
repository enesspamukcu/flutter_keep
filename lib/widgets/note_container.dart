import 'package:flutter/material.dart';
import 'package:flutter_keep/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class NoteContainer extends StatelessWidget {
  const NoteContainer({Key? key, required this.title,required this.note,required this.createdAt,required this.onPress,required this.color}) : super(key: key);
  final String title;
  final String note;
  final String createdAt;
  final Function onPress;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: (){
        onPress();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 5,left: 5,right: 5,top: 5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: color ==  Colors.transparent ?Border.all(style: BorderStyle.solid,color: themeProvider.hiveLocalStorage.fontStyleBox.getAt(0)!.lightMode==false ? Colors.grey : Colors.grey.shade600) :Border.all(style: BorderStyle.none)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style:themeProvider.themeControl(20, FontWeight.bold)),
              const SizedBox(height: 10,),
              Text(note,style: themeProvider.themeControl(16, FontWeight.normal)),
              const SizedBox(height: 10,),
              Text(createdAt,style:themeProvider.themeControl(14, FontWeight.w500) ),
            ],
          ),
        ),
      ),
    );
  }
}