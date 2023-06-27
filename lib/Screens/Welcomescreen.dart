import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidation/Screens/Sign_In%20_Screen.dart';
import 'package:formvalidation/blocs/SignInBloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CupertinoButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                  create: (BuildContext context) =>
                                      SignInBloc(),
                                  child: SignInScreen())));
                    },
                    color: Colors.orange,
                    child: Text('Sign  In via Email')),
                SizedBox(height: 10,),
                CupertinoButton(
                  child: Text(
                    'SignIn via Google',
                    // style: TextStyle(color: Colors.black45),
                  ),
                  onPressed: () {},
                  color: Colors.orange,
                ),
                SizedBox(height: 2,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
