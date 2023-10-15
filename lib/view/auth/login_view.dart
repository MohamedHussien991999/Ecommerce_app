import 'package:ecommerce_application/core/view_model/auth_view_model.dart';
import 'package:ecommerce_application/view/register_view.dart';
import 'package:ecommerce_application/view/widgets/custom_text.dart';
import 'package:ecommerce_application/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/constant.dart';

class LoginView extends GetWidget<AuthViewModel> {
  LoginView({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: 'Welcome,',
                      fontSize: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        elevation: 0,
                      ),
                      onPressed: () {
                        Get.to(RegisterView());
                      },
                      child: const CustomText(
                        text: 'Sign Up',
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: 'Sign in to continue',
                  fontSize: 14,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 30,
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
                        controller.signInWithEmailAndPassword();
                      }
                    },
                    child: const CustomText(
                      text: 'SIGN IN',
                      fontSize: 16,
                      color: Colors.white,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: '-OR-',
                  fontSize: 16,
                  alignment: Alignment.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                //Sign With google
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () {
                      controller.googleSignInMethod();
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/google.png',
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: CustomText(
                              text: 'Sign in with Google',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //Sign With facebook
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () {
                      controller.signInWithFacebook();
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/facebook.png',
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: CustomText(
                              text: 'Sign in with Facebook',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
