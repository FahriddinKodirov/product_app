import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:products_app/utils/my_colors.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: height(context) * 0.035),
            child: Form(
              key: formKey,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height(context) * 0.06),
                        child: Container(
                          height: height(context) * 0.058,
                          width: height(context) * 0.09,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black12),
                              borderRadius:
                                  BorderRadius.circular(height(context) * 0.05)),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: SvgPicture.asset(MyIcons.left),
                          ),
                        ),
                      ),
                      const Text('New\nPassword', style: TextStyle(fontSize: 30)),
                      SizedBox(height: height(context) * 0.03),
                      const Text('At least 8 characters, with uppercase, lowercase and special character.'),
                      SizedBox(height: height(context) * 0.03),
                      TextFormField(
                          validator: (value) =>
                              value != null && value.length < 6
                                  ? 'Password is incorrect'
                                  : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorHeight: 22,
                          controller: passwordController,
                          decoration: getInputDecoration(
                              icon: Icons.email_outlined,
                              word: 'Password',
                              eye: icon())),
                      SizedBox(height: height(context)*0.02,),
                      TextFormField(
                          validator: (value) =>
                              value != null && value.length < 6
                                  ? 'Confirm is incorrect'
                                  : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorHeight: 22,
                          controller: passwordController,
                          decoration: getInputDecoration(
                              icon: Icons.email_outlined,
                              word: 'Confirm',
                              eye: icon())),
                      SizedBox(height: height(context) * 0.04),
                      signInButtom(height(context), width(context))
                      
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

 Widget signInButtom(height,width){
  return InkWell(
      onTap: () {
      //!................
      },
      child: Container(
        height: height * 0.08,
        width: width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height * 0.06),
            gradient: gradientGreen()),
        child: const Center(
            child: Text(
          'Send me Link',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
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
