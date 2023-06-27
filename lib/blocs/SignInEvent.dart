abstract class SignInEvent{}

class SignInTextChangedEvent extends SignInEvent{
  String emailValue;
  String passwordValue;
  SignInTextChangedEvent(this.emailValue, this.passwordValue);
}

class SignInButtonPressedEvent extends SignInEvent{
  String email;
  String password;
  SignInButtonPressedEvent(this.email, this.password);
}