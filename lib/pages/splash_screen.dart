import 'package:flutter/material.dart';
import 'package:flutter_keep/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2500),(){
      Navigator.pushReplacementNamed(context,'/homePage');
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Constants.darkModeBackgrounColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/notebook.png',width: 200,height: 200,)),
           Text('Keep My Notes',style:GoogleFonts.openSans(color: Colors.white,fontSize: 24))
        ],
      ),
    );
  }
}