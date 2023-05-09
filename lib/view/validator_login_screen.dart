import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_sign_up_app/common/app_common_sign_in.dart';
import 'package:login_sign_up_app/common/app_common_textfield.dart';
import 'package:login_sign_up_app/view/validator_sign_up_screen.dart';

class ValidatorLoginScreen extends StatefulWidget {
  const ValidatorLoginScreen({super.key, required String title});

  @override
  State<ValidatorLoginScreen> createState() => _ValidatorLoginScreenState();
}

class _ValidatorLoginScreenState extends State<ValidatorLoginScreen> {
  bool passwordVisible = false;
  //bool _obscuretext = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? userCredential;
  dynamic value;
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      debugPrint("completed");
      setState(() {});
    });
  }

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
                  GestureDetector(
                    onTap: () {
                      if (validator()) {
                        debugPrint("Every thing is Good!");
                      } else {
                        loginUser();
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
                          "Don’t Have an Account?",
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

  showToastMessage(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white,
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
      showToastMessage("Please enter password");
      return false;
    } else if (!RegExp(
            "^(?=.*[A-Z].*[A-Z])(?=.*[!@#\$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}")
        .hasMatch(passwordController.text)) {
      showToastMessage("Please enter valid password");
      //return false;
    } else {
      return false;
    }
    return true;
  }

  loginUser() async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        debugPrint("User Data --> ${value.user}");
        if (value.user!.emailVerified) {
          userCredential = value.user;
          value.user!.sendEmailVerification();

          debugPrint("User has Login --> ");
        } else {
          showDialogue();
        }
        setState(() {});
      });
    } on FirebaseAuthException catch (error) {
      showToastMessage("Error Code --->>>${error.code}");
    }
  }

  showDialogue() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          height: 150,
          width: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Your Email was Not Verified!! \n-->If you Want to verify yor Email please press RESEND button",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel")),
                    const SizedBox(width: 30),
                    ElevatedButton(
                        onPressed: () {
                          userCredential = value.user;
                          value.user!.sendEmailVerification();
                          setState(() {});
                        },
                        child: const Text("Resend"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
