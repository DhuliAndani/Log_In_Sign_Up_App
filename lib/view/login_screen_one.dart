import 'package:flutter/material.dart';
import 'package:login_sign_up_app/common/app_common_sign_in.dart';
import 'package:login_sign_up_app/common/app_common_textfield.dart';
import 'package:login_sign_up_app/view/sign_up_screen_one.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required String title});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;
  final bool _obscuretext = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.arrow_back_ios),
                      Padding(
                        padding: EdgeInsets.only(left: 120),
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Color(0xFFFFC52D),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins",
                    ),
                  ),
                  // const SizedBox(height: 5),
                  const Text(
                    "Please enter your email address and \npassword below to sign in",
                    style: TextStyle(
                      fontFamily: "Sora",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: CommonTextField(
                      keyboardType: TextInputType.text,
                      controller: emailController,
                      textAlign: TextAlign.start,
                      color: const Color((0xFFD9D9D9)),
                      text: "Email",
                    ),
                  ),
                  const SizedBox(height: 15),
                  CommonTextField(
                    obscureText: !passwordVisible,
                    suffixIcon: IconButton(
                      autofocus: true,
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility_off,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                    controller: passwordController,
                    textAlign: TextAlign.start,
                    color: const Color((0xFFD9D9D9)),
                    text: "Password",
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    width: 375,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFC52D),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: TextButton(
                      child: const Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpOne(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      "OR",
                    ),
                  ),
                  const SizedBox(height: 30),
                  const CommonSignIn(
                    image: "assets/images/google.png",
                    text: "Sign in with Google",
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: CommonSignIn(
                      image: "assets/images/facebook.png",
                      text: "Sign in with Facebook",
                    ),
                  ),
                  const CommonSignIn(
                    image: "assets/images/apple.png",
                    text: "Sign in with Apple",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, top: 30),
                    child: Row(
                      children: [
                        const Text(
                          "Don’t Have an Account?",
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpOne()),
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xFFFFC52D),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
