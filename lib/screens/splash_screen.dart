import 'package:flutter/material.dart';
import 'screens.dart';
import '../custom_widgets/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkGreen,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/logo.png', height: 200, width: 200)],
          ),
        ));
  }
}
