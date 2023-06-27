import 'package:flutter/material.dart';

abstract class SignInState{}

class InitialSignInState extends SignInState{}
class SignInValidState extends SignInState{}
class SignInErrorState extends SignInState{
  String errormessage;
  SignInErrorState(this.errormessage);
}
class SignInLoadingState extends SignInState{

}