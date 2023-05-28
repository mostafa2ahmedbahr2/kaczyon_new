import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaczyon/start_screen.dart';

import 'core/nav.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin  {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late AnimationController animationController2;
  late Animation<Offset> slidingAnimation2;
  @override
  void initState() {
    super.initState();
    animation();
    navigateToAfterSplash();
  }

  void navigateToAfterSplash(){
    Future.delayed(const Duration(seconds: 3),(){
      AppNav.customNavigator(
        context: context,
        screen: const StartScreen(),
        finish: true,
      );
    });
  }

  void animation(){
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2,),
    );
    slidingAnimation = Tween<Offset>(begin:const Offset(0 , 40) ,end: Offset.zero).animate(animationController);
    animationController.forward();
    // slidingAnimation.addListener(() {setState((){});});
    animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2,),
    );
    slidingAnimation2 = Tween<Offset>(begin:const Offset(0 , -5) ,end: Offset.zero).animate(animationController2);
    animationController2.forward();
    // slidingAnimation2.addListener(() {setState((){});});
  }
  @override
  void dispose() {
    super.dispose();
    // اى controller لأازم نعمله dispose عشان ال resources
    animationController.dispose();
    animationController2.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return   Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // بنعمل كدا عشان نحسن الاداء
              AnimatedBuilder(
                animation: slidingAnimation2,
                builder: (context,_){
                  return  SlideTransition(
                      position: slidingAnimation2,
                      child: Image.asset("assests/images/600f00fb05cb0.png"));
                },
              ),
              const SizedBox(height: 5,),
              AnimatedBuilder(
                animation: slidingAnimation,
                builder: (context,_){
                  return  SlideTransition(
                    position: slidingAnimation,
                    child:const Text(".. شاهد المنتجات  ..",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                },

              ),

            ],
          ),
        ),
      ),
    );
  }
}