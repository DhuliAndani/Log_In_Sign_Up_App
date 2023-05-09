import 'package:flutter/material.dart';
import 'package:login_sign_up_app/common/app_common_sign_in.dart';
import 'package:login_sign_up_app/common/app_common_textfield.dart';
import 'package:login_sign_up_app/view/login_screen_one.dart';

class SignUpOne extends StatefulWidget {
  const SignUpOne({super.key});

  @override
  State<SignUpOne> createState() => _SignUpOneState();
}

class _SignUpOneState extends State<SignUpOne> {
  bool passwordVisible = false;
  bool _obscuretext = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.arrow_back_ios),
                        Padding(
                          padding: EdgeInsets.only(left: 120),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Color(0xFFFFC52D),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Create an Account",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                      ),
                    ),
                    // const SizedBox(height: 5),
                    const Text(
                      "Please enter your email address and choose a \npassword below to create an account",
                      style: TextStyle(
                        fontFamily: "Sora",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: CommonTextField(
                        controller: emailController,
                        textAlign: TextAlign.start,
                        color: const Color((0xFFD9D9D9)),
                        text: "Enter email",
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
                      text: "Create password",
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
                      controller: confirmpasswordController,
                      textAlign: TextAlign.start,
                      color: const Color((0xFFD9D9D9)),
                      text: "Confirm password",
                    ),

                    const SizedBox(height: 45),
                    Container(
                      height: 60,
                      width: 375,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFC52D),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: const Center(
                        child: Text(
                          //textAlign: TextAlign.center,
                          "SIGN UP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      // child: TextButton(
                      //   child: const Text(
                      //     "SIGN UP",
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 16,
                      //     ),
                      //   ),
                      // onPressed: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const LoginScreen(),
                      //     ),
                      //   );
                      // },
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
                            "Already have an account?",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen(
                                          title: '',
                                        )),
                              );
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Color(0xFFFFC52D), fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])),
        ),
      ),
    );
  }
}
