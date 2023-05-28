
abstract class LoginStates{}

class LoginInitState extends LoginStates{}

class ChangeSuffixIconState extends LoginStates{}


class LoginLoadingState extends LoginStates{}
class LoginErrorState extends LoginStates{
  String error;
  LoginErrorState(this.error);
}
class LoginSuccessState extends LoginStates{}