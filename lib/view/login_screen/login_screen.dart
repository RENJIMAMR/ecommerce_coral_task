import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_application/controller/login_controller.dart';
import 'package:shopping_application/view/home_screen/home_screen.dart';
import 'package:shopping_application/view/registration_screen/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController email_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return Scaffold(
              appBar: AppBar(),
              body: GetBuilder(
                builder: (LoginController controller) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "Sign in to Your Account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),

                        // email input fied
                        TextFormField(
                          validator: (value) {
                            if (email_controller.text != null &&
                                    email_controller.text.isNotEmpty &&
                                    email_controller.text.contains('@gmail') ||
                                email_controller.text.contains('.in')) {
                              return null;
                            } else {
                              return 'Enter Valid Email';
                            }
                          },
                          controller: email_controller,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            hintText: "Your Eamil Address",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color(0xff1a75d2),
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.red.shade400,
                                )),
                          ),
                        ),
                        SizedBox(height: 20),
                        // password input field
                        TextFormField(
                          validator: (value) {
                            if (pass_controller.text != null &&
                                pass_controller.text.isNotEmpty &&
                                pass_controller.text.length >= 5 &&
                                pass_controller.text.length <= 12) {
                              return null;
                            } else {
                              return ' Enter a Valid Password';
                            }
                          },
                          controller: pass_controller,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              hintText: "Your Password",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade400,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff1a75d2),
                                  )),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.red.shade400,
                                  )),
                              suffixIcon: Icon(
                                Icons.visibility_off_rounded,
                                color: Colors.grey,
                              )),
                        ),
                        SizedBox(height: 20),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              controller.onLogin(
                                  email: email_controller.text,
                                  pass: pass_controller.text,
                                  context: context);
                            }

                            // Todo : write code  to navigate to home screen on successful Login with registered credentials
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xff1a75d2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationScreen(),
                                      ));

                                  // Todo : write code  to navigate to registration screen
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Color(0xff1a75d2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ));
        }
      },
    );
  }
}
