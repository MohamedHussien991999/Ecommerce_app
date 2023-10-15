import 'package:ecommerce_application/constant/constant.dart';
import 'package:ecommerce_application/core/view_model/auth_view_model.dart';
import 'package:ecommerce_application/view/auth/login_view.dart';
import 'package:ecommerce_application/view/widgets/custom_text.dart';
import 'package:ecommerce_application/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  RegisterView({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
              onTap: () {
                Get.off( () => LoginView());
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50.0,
            left: 20,
            right: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const CustomText(
                  text: 'Sign Up,',
                  fontSize: 30,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: 'Sign Up to continue',
                  fontSize: 14,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  hintFontSize: 14,
                  labelFontSize: 14,
                  labelText: 'User Name',
                  hintText: '   Enter your User Name ',
                  onSave: (value) {
                    controller.name = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  hintFontSize: 14,
                  labelFontSize: 14,
                  labelText: 'Email',
                  hintText: '   Enter your email address',
                  onSave: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  hintFontSize: 14,
                  labelFontSize: 14,
                  labelText: 'Password',
                  hintText: '   Enter your password',
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: 'Forgot Password?',
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        controller.createAccountWithEmailAndPassword();
                      }
                    },
                    child: const CustomText(
                      text: 'SIGN UP',
                      fontSize: 16,
                      color: Colors.white,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Sign With google
              ],
            ),
          ),
        ),
      ),
    );
  }
}
