import 'dart:ffi';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:products_app/screen/auth_page/forgot/forgot_email.dart';
import 'package:products_app/screen/auth_page/forgot/forgot_password.dart';
import 'package:products_app/screen/auth_page/register/widget/login_in_text.dart';
import 'package:products_app/screen/auth_page/register/widget/web_widget/web_view.dart';
import 'package:products_app/utils/my_colors.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';
import 'package:products_app/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickSignUp;

  const LoginPage({super.key, required this.onClickSignUp});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: height(context) * 0.035),
          child: Form(
            key: formKey,
            child: Stack(
              children: [
                SafeArea(
                  child: SizedBox(
                    height: height(context),
                    width: width(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height(context) * 0.026),
                        back(context),
                        SizedBox(height: height(context) * 0.06),
                        const Text('Welcome back\nto Grofast!',
                            style: TextStyle(fontSize: 30)),
                        SizedBox(height: height(context) * 0.06),
                        TextFormField(
                            validator: (value) =>
                                value != null && !EmailValidator.validate(value)
                                    ? 'Email address is incorrect'
                                    : null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorHeight: 22,
                            controller: emailController,
                            decoration: getInputDecoration(
                                icon: Icons.email_outlined,
                                word: 'Email Adress',
                                eye: icon())),
                        SizedBox(height: height(context) * 0.03),
                        TextFormField(
                          validator: (password) =>
                              password != null && password.length < 6
                                  ? 'Password is incorrect'
                                  : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: isTrue,
                          controller: passwordController,
                          decoration: getInputDecoration(
                              icon: Icons.lock_outline_sharp,
                              word: 'Password',
                              eye: icon()),
                          cursorHeight: 22,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height(context) * 0.3,
                  left: width(context) * 0.53,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const ForgotPassword()));
                    },
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: const EdgeInsets.only(),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: height(context)*0.61,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: SignIn,
                        child: Container(
                          height: height(context) * 0.08,
                          width: width(context) * 0.85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  height(context) * 0.06),
                              gradient: gradientGreen()),
                          child: const Center(
                              child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      SizedBox(height: height(context) * 0.03),
                      const Center(child: Text('or With')),
                      SizedBox(height: height(context) * 0.03),
                      const WebWiew(),
                      SizedBox(height: height(context) * 0.086),
                      Center(
                          child: LoginInText(
                              onClickSignUp: widget.onClickSignUp,)),
                    ],))
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> SignIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    await Provider.of<AuthViewModel>(context, listen: false).signIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget icon() {
    return isTrue
        ? IconButton(
            icon: SvgPicture.asset(MyIcons.hideEye, color: Colors.black54),
            onPressed: () {
              setState(() {
                isTrue = !isTrue;
              });
            },
          )
        : IconButton(
            icon: SvgPicture.asset(MyIcons.eye, color: Colors.black54),
            onPressed: () {
              setState(() {
                isTrue = !isTrue;
              });
            },
      );
  }
}
