import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:products_app/utils/my_colors.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';


class ForgotEmail extends StatefulWidget {
  const ForgotEmail({super.key});

  @override
  State<ForgotEmail> createState() => _ForgotEmailState();
}

class _ForgotEmailState extends State<ForgotEmail> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
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
                      const Text('Forgot\nPassword', style: TextStyle(fontSize: 30)),
                      SizedBox(height: height(context) * 0.03),
                      const Text('Please enter your number. We will send a code\nto your phone to reset your password.'),
                      SizedBox(height: height(context) * 0.03),
                      TextFormField(
                          validator: (value) =>
                              value != null && EmailValidator.validate(value)
                                  ? 'Email address is incorrect'
                                  : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorHeight: 22,
                          controller: emailController,
                          decoration: getInputDecoration(
                              icon: Icons.email_outlined,
                              word: 'Email Adress',
                              eye: icon())),
                      SizedBox(height: height(context) * 0.2),
                      
                      
                    ],
                  ),
                  Positioned(
                    top: height(context)*0.5,
                    child: signInButtom(height(context), width(context)))
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
        width: width * 0.85,
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
