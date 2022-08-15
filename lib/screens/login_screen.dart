import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../components/already_have_an_account_acheck.dart';
import '../../components/rounded_button.dart';
import '../../components/rounded_input_field.dart';
import '../../components/rounded_password_field.dart';
import '../background.dart';
import '../color_constant.dart';
import '../controllers/authentication_manager.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  AuthenticationManager _authManager = Get.put(AuthenticationManager());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Background(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // const Text(
                        //   "LOGIN",
                        //   style: TextStyle(fontWeight: FontWeight.bold),
                        // ),
                        SizedBox(height: size.height * 0.03),
                        SvgPicture.asset(
                          "assets/icons/login.svg",
                          height: size.height * 0.35,
                        ),
                        SizedBox(height: size.height * 0.03),
                        RoundedInputField(
                          messageError: "Please enter your email.",
                          controller: _authManager.emailCon,
                          isEmail: true,
                          hintText: "Enter username",
                          onChanged: (value) {},
                        ),
                        RoundedPasswordField(
                          controller: _authManager.passCon,
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          width: size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.bottomSheet(
                                    Container(
                                      height: size.height,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 5,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.email_outlined,
                                            size: 100,
                                            color: Colors.deepPurple,
                                          ),
                                          SizedBox(
                                            width: size.width * 0.8,
                                            child: const Text(
                                                'Enter the email address associated with your account.'),
                                          ),
                                          // RoundedInputField(
                                          //   controller:
                                          //       _authManager.emailController,
                                          //   messageError:
                                          //       "Please enter your email",
                                          //   icon: Icons.email,
                                          //   isEmail: true,
                                          //   hintText: "Your Email",
                                          //   onChanged: (value) {},
                                          // ),
                                          SizedBox(
                                            width: size.width * 0.8,
                                            child: Row(
                                              children: [
                                                RoundedButton(
                                                  press: () {},
                                                  text: 'Send',
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    barrierColor: Colors.white,
                                    isDismissible: false,
                                  );
                                },
                                child: const Text(
                                  'Forgot password',
                                  style: TextStyle(color: primaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        RoundedButton(
                          text: "LOGIN",
                          press: () {
                            _authManager.login();
                            // String email = _authManager.emailController.text;
                            // String pass = _authManager.passwordController.text;
                            // if (_formKey.currentState!.validate()) {
                            //   _authManager.login(email: email, password: pass);
                            // }
                          },
                        ),
                        SizedBox(height: size.height * 0.03),
                        AlreadyHaveAnAccountCheck(
                          press: () {
                            Get.toNamed('/signup');
                            // return Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return SignUpScreen();
                            //     },
                            //   ),
                            // );
                          },
                        ),
                        SizedBox(height: size.height * 0.02),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
