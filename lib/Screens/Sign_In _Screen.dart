import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidation/blocs/SignInBloc.dart';
import 'package:formvalidation/blocs/SignInEvent.dart';
import 'package:formvalidation/blocs/SignInState.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In with Email'),
        // backgroundColor: Color(0x4debcbef),
      ),
      body: SafeArea(
        child: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            padding: EdgeInsets.only(left: 30, right: 30),
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errormessage,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: 1,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Email Address",
                    hintStyle: TextStyle(color: Colors.grey)),
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          emailController.text, passwordController.text));
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey)),
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          emailController.text, passwordController.text));
                },
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (BuildContext context, state) {
                  return CupertinoButton(
                    child: Text('Sign In'),
                    onPressed: () {},
                    color: (state is SignInValidState)
                        ? Colors.orange
                        : Colors.grey,
                  );
                },
              )
            ]),
      ),
    );
  }
}
