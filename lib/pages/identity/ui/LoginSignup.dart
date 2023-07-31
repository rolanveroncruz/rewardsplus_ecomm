
import 'package:flutter/material.dart';
import 'package:rewardsplus_ecomm/widgets/bottomnav.dart';
import 'package:rewardsplus_ecomm/widgets/my_button.dart';
import 'package:rewardsplus_ecomm/widgets/my_textfield.dart';

class LoginSignUp extends StatefulWidget {
  const LoginSignUp({super.key});

  @override
  State<LoginSignUp> createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MyMainBottomNav(currentTabIndex: 1,),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock, size: 100),
                  const SizedBox(
                    height: 20,
                  ),
                  // Hello again!
                  // Text(
                  //   'Hello Again!',
                  //   style: GoogleFonts.bebasNeue(fontSize: 52),
                  // ),
                  const Text("Welcome back, you've been missed!",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  // email textfield

                  MyTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Possword?",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),

                  // not a member? register now
                  MyButton(text: "Sign In", onTap: signUserIn),
                  const SizedBox(height: 50),

                  // not a member? register now
                  const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Not a member?"),
                    SizedBox(width: 4),
                    Text("Register Now",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold))
                  ]),
                ],
              ),
            ),
          ),
        ));
  }

  void signUserIn(){

  }

}
