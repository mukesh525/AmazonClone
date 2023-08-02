import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_amazon_clone/common/widgets/custom_button.dart';
import 'package:flutter_amazon_clone/common/widgets/custom_textfield.dart';
import 'package:flutter_amazon_clone/constants/global_variable.dart';

import '../services/auth_services.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routename = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signupUser() {
    authService.signupUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Create Account.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? value) => {
                  setState(() {
                    _auth = value!;
                  })
                },
              ),
            ),
            if (_auth == Auth.signup)
              Container(
                padding: const EdgeInsets.all(8.0),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _nameController,
                        hinText: "Name",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        hinText: "Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hinText: "Password",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CutsomButton(
                        text: "Signup",
                        onTap: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            signupUser();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Sign-In.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? value) => {
                  setState(() {
                    _auth = value!;
                  })
                },
              ),
            ),
            if (_auth == Auth.signin)
              Container(
                padding: const EdgeInsets.all(8.0),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        hinText: "Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hinText: "Password",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CutsomButton(
                        text: "Signup",
                        onTap: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            // signupUser();
                            print("valid");
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
