import 'package:ecommerce_application/core/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondView extends StatelessWidget {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<AuthViewModel>(
                init: AuthViewModel(),
                builder: (value) => const Text('Value is')),
            GetBuilder<AuthViewModel>(
                builder: (val) => ElevatedButton(
                    onPressed: () {
                     
                    },
                    child: const Text('Increment'))),
          ],
        ),
      ),
    );
  }
}
