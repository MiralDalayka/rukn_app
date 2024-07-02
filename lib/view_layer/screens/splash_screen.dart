import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rukn_app/Utils/const_routers.dart';
import 'package:rukn_app/utils/theme_manager.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //TODO: check user internet connection
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(
        context,
     homeRoute
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          LottieBuilder.asset('assets/images/splash_animation.json'),
            const SizedBox(height: 20,),
             Text("Rukn: Where Shopping Begins",style: TextStyle(color: ThemeManager.primaryColor),)

          ],
        ),
      ),
    );
  }
}