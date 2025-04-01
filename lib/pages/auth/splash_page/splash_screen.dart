import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicapp_clone/assets/app_vectors.dart';
import 'package:musicapp_clone/pages/home/mainpage/home_screen.dart';
import '../get_start_page/get_start_screen.dart';


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
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppVector.logo),
      ),
    );
  }


  Future<void> redirect() async{
    await Future.delayed(const Duration(seconds: 2));

    if(!context.mounted) return;

    User? user = FirebaseAuth.instance.currentUser;
    if(user != null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:
          (context) => const HomeScreen()));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder:
          (context) => const GetStartScreen()));
    }
  }
}
