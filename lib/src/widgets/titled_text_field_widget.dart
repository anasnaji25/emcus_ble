import 'package:emcus_ble/src/const/app_fonts.dart';
import 'package:emcus_ble/src/widgets/custom_height.dart';
import 'package:flutter/material.dart';

class TitledTextFieldWidget extends StatefulWidget {
  String title;
  String hintText;
  String validationText;
  bool isEmail;
  bool isPassword;
  TextEditingController textEditingController;
  TitledTextFieldWidget(
      {super.key,
      required this.hintText,
      this.isEmail = false,
      this.isPassword = false,
      required this.title,
      required this.textEditingController,
      required this.validationText});

  @override
  State<TitledTextFieldWidget> createState() => _TitledTextFieldWidgetState();
}

class _TitledTextFieldWidgetState extends State<TitledTextFieldWidget> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: primaryFont.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
          ),
          setHeight(7),
          TextFormField(
            controller: widget.textEditingController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return widget.validationText;
              }
              if (widget.isPassword) {
                if (value.length < 8) {
                  return "Password must be 8 characters long.";
                }
              }
              return null;
            },
            keyboardType: widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
            obscureText: widget.isPassword ? isVisible : false,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(10)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black26.withOpacity(0.5), width: 0.5),
                    borderRadius: BorderRadius.circular(10)),
                hintText: widget.hintText,
                hintStyle:
                    primaryFont.copyWith(fontSize: 14, color: Colors.black45),
                suffixIcon: widget.isPassword
                    ? !isVisible
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            child: Icon(Icons.visibility))
                        : InkWell(
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            child: Icon(Icons.visibility_off))
                    : Container(
                        width: 3,
                        height: 2,
                      )),
          )
        ],
      ),
    );
  }
}
