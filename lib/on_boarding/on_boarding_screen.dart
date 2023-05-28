import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../core/sh.dart';
import '../login/login_screen.dart';
import '../models/on_boarding_model.dart';
import '../widgets/custom_botton.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit,OnBoardingStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = OnBoardingCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: SafeArea(
              child: Scaffold(
                backgroundColor:  Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  actions: [
                    const SizedBox(width: 5,),
                    TextButton(
                      onPressed: () {
                        SharedPreferencesHelper.saveData(key: 'isBoarding', value: true)
                            .then((value) {
                          if (value) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                                    (route) => false);
                          }
                        });
                      },
                      child: const Text(
                        "تخطى ",
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1.2,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          controller: cubit.boardingController,
                          onPageChanged: (int index) {
                            if (index == cubit.boarding.length - 1) {
                              setState(() {
                                cubit.isLast = true;
                              });
                            } else {
                              setState(() {
                                cubit.isLast = false;
                              });
                            }
                          },
                          itemBuilder: (context, index) =>
                              buildOnBoarding(cubit.boarding[index]),
                          itemCount: cubit.boarding.length,
                        ),
                      ),
                      SmoothPageIndicator(
                        controller:cubit.boardingController,
                        count: cubit.boarding.length,
                        axisDirection: Axis.horizontal,
                        effect:  const ExpandingDotsEffect(
                          spacing: 10.0,
                          dotWidth: 20,
                          expansionFactor: 4.0,
                          dotHeight: 16.0,
                          dotColor:  Colors.grey,
                          activeDotColor: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 50,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                        child: CustomButton(
                          width: double.infinity,
                          height: 60,
                          btnColor: Colors.orange,
                          btnText:const Text("التالى",
                            style: TextStyle(
                              fontSize: 20,
                            ),),
                          onPressed: (){
                            if (cubit.isLast) {
                              SharedPreferencesHelper.saveData(key: 'isBoarding', value: true)
                                  .then((value) {
                                if (value) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const LoginScreen()),
                                          (route) => false);
                                }
                              });
                            } else {
                              cubit.boardingController.nextPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }

  Widget buildOnBoarding(OnBoardingModel model) => Stack(
    alignment: Alignment.center,
    children: [
      Image.asset(model.image!,height: 200,width: double.infinity,),
      Text(
        model.head!,
        style: const TextStyle(
          fontSize: 24.0,
          color: Colors.orange,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}