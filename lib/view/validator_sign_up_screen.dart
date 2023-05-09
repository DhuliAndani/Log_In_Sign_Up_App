import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_sign_up_app/common/app_common_sign_in.dart';
import 'package:login_sign_up_app/common/app_common_textfield.dart';

class ValidatorSignUpScreen extends StatefulWidget {
  const ValidatorSignUpScreen({super.key});

  @override
  State<ValidatorSignUpScreen> createState() => _ValidatorSignUpScreenState();
}

class _ValidatorSignUpScreenState extends State<ValidatorSignUpScreen> {
  bool passwordVisible = false;
  //bool _obscuretext = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool checkBoxData = true;
  bool visiblePassword = false;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? userCredential;

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
                    GestureDetector(
                      onTap: () {
                        if (validator()) {
                          debugPrint("Every thing is Good!");
                        } else {
                          signupUser();
                        }
                      },
                      child: Container(
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
                                    builder: (context) =>
                                        const ValidatorSignUpScreen()),
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

  showToastMessage(message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black45,
      textColor: Colors.black26,
      fontSize: 16.0,
    );
  }

  bool validator() {
    if (emailController.text.isEmpty) {
      showToastMessage("Please enter email");
      return false;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text)) {
      showToastMessage("Please enter valid email");
      return false;
    } else if (passwordController.text.isEmpty) {
      showToastMessage("Please enter Referral code");
      return false;
    } else if (!RegExp(
            "^(?=.*[A-Z].*[A-Z])(?=.*[!@#\$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}")
        .hasMatch(passwordController.text)) {
      showToastMessage("Please enter Referral code");
      return false;
    } else if (passwordController.text.isEmpty) {
      showToastMessage("Please enter password");
      return false;
    } else if (!RegExp(
            "^(?=.*[A-Z].*[A-Z])(?=.*[!@#\$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}")
        .hasMatch(passwordController.text)) {
      showToastMessage("Please enter valid password");
    } else {
      return false;
    }
    return true;
  }

  signupUser() async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        debugPrint("User Data --> ${value.user}");
        userCredential = value.user;
        value.user!.sendEmailVerification();
        setState(() {});
      });
    } on FirebaseAuthException catch (error) {
      showToastMessage(error.message);
      showToastMessage(error.code);
      debugPrint(error.message);
      debugPrint(error.code);
    }
  }
}
