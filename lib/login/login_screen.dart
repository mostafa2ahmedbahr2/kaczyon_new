

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaczyon/widgets/custom_botton.dart';
import 'package:page_transition/page_transition.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return   BlocProvider(
      create: (context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context,snapshot){
              return Directionality(
                textDirection: TextDirection.rtl,
                child: SafeArea(
                  child: Scaffold(
                    body:snapshot.data == ConnectivityResult.none ?
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/wifi.png",
                            height: 100,),
                          const  SizedBox(
                            height: 20,
                          ),
                          const  Text(  "No Internet",
                           style: TextStyle(
                             fontSize: 30,
                             fontWeight: FontWeight.bold,
                             color: Colors.black87,
                           ),),
                        ],
                      ),
                    ):
                    Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assests/images/600f00fb05cb0.png",
                                  width: 150,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: TextFormField(
                                    controller: cubit.phoneCon,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    // controller: cubit.emailCon,
                                    validator: (value)
                                    {
                                      if(value!.isEmpty)
                                      {
                                        return " الرقم المستخدم غير صيحيح";
                                      }
                                      return null;
                                    },
                                    decoration:   InputDecoration(
                                      border:OutlineInputBorder(),
                                      enabledBorder:   OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50.0),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          )
                                      ),
                                      focusedBorder:   OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50.0),
                                          borderSide: BorderSide(
                                            color: Colors.orange,
                                          )
                                      ),
                                      hintText: "رقم الموبايل",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      // prefixIcon: Icon(Icons.email,
                                      //   color: Colors.black,
                                      // ),
                                    ),
                                  ),
                                ),
                                const  SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: TextFormField(
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    onFieldSubmitted: (value)
                                    {
                                      if(formKey.currentState!.validate())
                                      {

                                      }
                                    },
                                    obscureText: cubit.isVisible,
                                    controller: cubit.passCon,
                                    validator: (value){
                                      if(value!.isEmpty)
                                      {
                                        return "كلمة السر التى ادخلتها غير صحيحة";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border:const OutlineInputBorder(),
                                      enabledBorder:  OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50.0),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          )
                                      ),
                                      focusedBorder:   OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50.0),
                                          borderSide: BorderSide(
                                            color: Colors.orange,
                                          )
                                      ),
                                      hintText: "كلمة السر",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                      suffixIcon: IconButton(
                                        color: Colors.black,
                                        icon: cubit.isVisible ?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                                        onPressed: (){
                                          cubit.changeSuffixIcon();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                const  SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey
                                    ),
                                  ),
                                  child:  Center(child: Text("تسجيل الدخول")),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text("ليس لديك حساب ؟ ",
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                ),
                                TextButton(
                                  onPressed: (){
                                    // Navigator.push(
                                    //     context, PageTransition(
                                    //     duration: const Duration(milliseconds: 400),
                                    //     reverseDuration: const Duration(milliseconds: 400),
                                    //     type: PageTransitionType.rightToLeft,
                                    //     child:  const SignUpScreen(),
                                    //     inheritTheme: true,
                                    //     ctx: context));
                                  },
                                  child:const Text( "انشأ حسابك",
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Image.asset("assets/images/facebook1.png",height: 50,),
                                //     const CustomSizedBox(
                                //       width: 20,
                                //     ),
                                //     Image.asset("assets/images/google.png",height: 50,),
                                //
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}