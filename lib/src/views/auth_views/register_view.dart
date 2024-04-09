import 'package:emcus_ble/src/const/app_colors.dart';
import 'package:emcus_ble/src/const/app_fonts.dart';
import 'package:emcus_ble/src/const/app_images.dart';
import 'package:emcus_ble/src/controllers/auth_controller.dart';
import 'package:emcus_ble/src/models/user_details_model.dart';
import 'package:emcus_ble/src/views/auth_views/sign_in_view.dart';
import 'package:emcus_ble/src/views/auth_views/splash_view.dart';
import 'package:emcus_ble/src/widgets/custom_height.dart';
import 'package:emcus_ble/src/widgets/titled_text_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isChecked = false;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController confirmPassWordController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: size.width,
          height: size.height * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: SingleChildScrollView(
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
                        "Register",
                        style: primaryFont.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ],
                  ),
                  setHeight(10),
                  TitledTextFieldWidget(
                    title: "Name",
                    hintText: "Enter your Name",
                    validationText: "Name can't be empty",
                    textEditingController: nameController,
                  ),
                  setHeight(10),
                  TitledTextFieldWidget(
                    title: "Company Name",
                    hintText: "Enter your company name",
                    validationText: "Company name can't be empty",
                    textEditingController: companyNameController,
                  ),
                  setHeight(10),
                  TitledTextFieldWidget(
                    title: "Email Address",
                    hintText: "Enter your email address",
                    isEmail: true,
                    validationText: "Email Can't be empty",
                    textEditingController: emailcontroller,
                  ),
                  setHeight(10),
                  TitledTextFieldWidget(
                    title: "Password",
                    hintText: "Enter your password",
                    isPassword: true,
                    validationText: "Passowrd Can't be empty",
                    textEditingController: passWordController,
                  ),
                  setHeight(10),
                  TitledTextFieldWidget(
                    title: "Confirm Password",
                    hintText: "Enter your password",
                    isPassword: true,
                    validationText: "Passowrd Can't be empty",
                    textEditingController: confirmPassWordController,
                  ),
                  setHeight(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        RichText(
                            text: TextSpan(
                                text:
                                    "By signing up you are agreeing with the\nFFE ",
                                style:
                                    primaryFont.copyWith(color: Colors.black45,fontSize: 12),
                                children: [
                              TextSpan(
                                  text: "Terms & Conditions",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => print('Tap Here onTap'),
                                  style: primaryFont.copyWith(
                                      color: secondaryColor,fontSize: 12)),
                              TextSpan(
                                text: " and ",
                                style:
                                    primaryFont.copyWith(color: Colors.black45),
                              ),
                              TextSpan(
                                  text: "Privacy Policy",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => print('Tap Here onTap'),
                                  style: primaryFont.copyWith(
                                    color: secondaryColor,fontSize: 12
                                  ))
                            ]))
                      ],
                    ),
                  ),
                  setHeight(16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(horizontal: 30)),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {
                              Get.offAll(() => SignInView());
                            },
                            child: Text(
                              "Cancel",
                              style:
                                  primaryFont.copyWith(color: Colors.black45),
                            )),
                        Obx(
                          () => authController.isloading.isTrue
                              ? ElevatedButton(
                                  style: const ButtonStyle(
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.symmetric(
                                              horizontal: 35, vertical: 10)),
                                      backgroundColor: MaterialStatePropertyAll(
                                          secondaryColor)),
                                  onPressed: () {},
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                  ))
                              : ElevatedButton(
                                  style: const ButtonStyle(
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.symmetric(
                                              horizontal: 35, vertical: 14)),
                                      backgroundColor: MaterialStatePropertyAll(
                                          secondaryColor)),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (passWordController.text ==
                                          confirmPassWordController.text) {
                                        if (isChecked) {
                                          UserDataModel userDataModel =
                                              UserDataModel(
                                                  companyName:
                                                      companyNameController
                                                          .text,
                                                  email: emailcontroller.text,
                                                  name: nameController.text);
                                          authController.registerUser(
                                              userDataModel: userDataModel,
                                              password:
                                                  passWordController.text);
                                        }else{
                                          Get.rawSnackbar(
                                            message:
                                                "Accept terms & conditions before continue");
                                        }
                                      } else {
                                        Get.rawSnackbar(
                                            message:
                                                "Passwords you entered do not match. Please make sure your passwords match and try again.");
                                      }
                                    }
                                  },
                                  child: Text(
                                    "Register",
                                    style: primaryFont.copyWith(
                                        color: Colors.white),
                                  )),
                        )
                      ],
                    ),
                  ),
                  setHeight(18),
                  Center(
                    child: RichText(
                        text: TextSpan(
                            text: "Already have account? ",
                            style: primaryFont.copyWith(color: Colors.black45),
                            children: [
                          TextSpan(
                              text: "Sign in here",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.offAll(() => SignInView()),
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
        ),
      ),
    );
  }
}
