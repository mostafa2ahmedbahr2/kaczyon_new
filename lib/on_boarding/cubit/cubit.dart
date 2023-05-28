

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaczyon/on_boarding/cubit/states.dart';

import '../../models/on_boarding_model.dart';


class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingStatesInitState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  var boardingController = PageController();
  bool isLast = false;

  List<OnBoardingModel> boarding = [
    OnBoardingModel("assests/images/10.jpg", "1"),
    OnBoardingModel("assests/images/10.jpg", "2"),
    OnBoardingModel("assests/images/10.jpg", "3"),
  ];

}