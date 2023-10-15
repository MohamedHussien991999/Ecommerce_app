import 'package:ecommerce_application/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/view_model/checkout_view_model.dart';
import '../widgets/custom_text.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
        init: CheckOutViewModel(),
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: 'Billing Address is the same as delivery address',
                  fontSize: 20,
                  alignment: Alignment.center,
                  maxLine: 2,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  onSave: (value) {
                    controller.street1 = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'You must write your street';
                    }
                    return null;
                  },
                  labelText: 'Street 1',
                  hintText: '21, Alex Davidson Avenue',
                  hintFontSize: 20,
                ),
                const SizedBox(
                  height: 40,
                ),
                 CustomTextFormField(
                  onSave: (value) {
                    controller.street2 = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'You must write your street';
                    }
                    return null;
                  },
                  labelText: 'Street 2',
                  hintText: 'Opposite Omegatron, Vicent Quarters',
                  hintFontSize: 20,
                ),
                const SizedBox(
                  height: 40,
                ),
                 CustomTextFormField(
                  labelText: 'City',
                  hintText: 'Victoria Island',
                  hintFontSize: 20,
                  onSave: (value) {
                    controller.city = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'You must write your city';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: Get.width,
                  child:  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: CustomTextFormField(
                            onSave: (value) {
                              controller.zipCode = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'You must write your zip code';
                              }
                              return null;
                            },
                            labelText: 'State',
                            hintText: 'Lagos State',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: CustomTextFormField(
                            onSave: (value) {
                              controller.country = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'You must write your country';
                              }
                              return null;
                            },
                            labelText: 'Country',
                            hintText: 'Nigeria',
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
