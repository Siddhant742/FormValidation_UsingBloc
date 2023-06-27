
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidation/blocs/SignInEvent.dart';
import 'package:formvalidation/blocs/SignInState.dart';
import 'package:email_validator/email_validator.dart';

class SignInBloc extends Bloc<SignInEvent,SignInState> {
  SignInBloc() : super(InitialSignInState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState('Enter valid email address'));
      }
      else if(event.passwordValue.length < 8){
        emit(SignInErrorState('Your password must be 8 characters'));
      }
      else{
        emit(SignInValidState());
      }
    });
    on<SignInButtonPressedEvent>((event, emit) => emit(SignInValidState()));
  }
}
