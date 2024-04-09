import 'package:emcus_ble/src/const/app_colors.dart';
import 'package:emcus_ble/src/const/app_fonts.dart';
import 'package:emcus_ble/src/const/app_images.dart';
import 'package:emcus_ble/src/controllers/auth_controller.dart';
import 'package:emcus_ble/src/views/auth_views/register_view.dart';
import 'package:emcus_ble/src/views/auth_views/splash_view.dart';
import 'package:emcus_ble/src/widgets/custom_height.dart';
import 'package:emcus_ble/src/widgets/titled_text_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isChecked = false;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passWordController = TextEditingController();

   final _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Image.asset(logoImage2),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    setHeight(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign In",
                          style: primaryFont.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ],
                    ),
                    setHeight(10),
                    TitledTextFieldWidget(
                      textEditingController: emailcontroller,
                      title: "Email Address",
                      hintText: "Enter your email address",
                      isEmail: true,
                      validationText: "Email Can't be empty",
                    ),
                    setHeight(10),
                    TitledTextFieldWidget(
                      textEditingController: passWordController,
                      title: "Password",
                      hintText: "Enter your password",
                      isPassword: true,
                      validationText: "Passowrd Can't be empty",
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: secondaryColor,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          Text(
                            "Remember me",
                            style: primaryFont.copyWith(color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        "Forgot Password?",
                        style: primaryFont.copyWith(
                            color: secondaryColor, fontWeight: FontWeight.w500),
                      ),
                    ),
                    setHeight(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(()=> authController.isloading.isTrue ? ElevatedButton(
                              style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(horizontal: 30)),
                                  backgroundColor:
                                      MaterialStatePropertyAll(secondaryColor)),
                              onPressed: () {},
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                              ))  :ElevatedButton(
                              style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(horizontal: 30)),
                                  backgroundColor:
                                      MaterialStatePropertyAll(secondaryColor)),
                              onPressed: () {
                                if(_formKey.currentState!.validate()){
                                  authController.loginUser(email: emailcontroller.text, password: passWordController.text);
                                }
                              },
                              child: Text(
                                "Sign In",
                                style: primaryFont.copyWith(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                    setHeight(15),
                    Center(
                      child: RichText(
                          text: TextSpan(
                              text: "Don't have an account? ",
                              style: primaryFont.copyWith(color: Colors.black45),
                              children: [
                            TextSpan(
                                text: "Sign up here",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.off(()=> const RegisterView()),
                                style: primaryFont.copyWith(
                                    color: secondaryColor,
                                    fontWeight: FontWeight.w500))
                          ])),
                    ),
                    setHeight(15)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
