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
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In with Email'),
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
                  }
                  else{
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: 1,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Email Address",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              SizedBox(
                height: 10,
              ),
              CupertinoButton(
                child: Text('Sign In'),
                onPressed: () {
                  CircularProgressIndicator();
                },
                color: Colors.orange,
              )
            ]),
      ),
    );
  }
}
