// ignore_for_file: avoid_print
import 'package:ecommerce_application/constant/constant.dart';
import 'package:ecommerce_application/core/view_model/cart_view_model.dart';
import 'package:ecommerce_application/view/widgets/custom_button.dart';
import 'package:ecommerce_application/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'checkout/checkout_view.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        builder: (controller) => Scaffold(
              body: controller.cartProductModel.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/empty_cart.svg',
                          width: 200,
                          height: 200,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomText(
                          text: 'Cart Empty',
                          fontSize: 40,
                          alignment: Alignment.topCenter,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ListView.separated(
                            itemCount: controller.cartProductModel.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 150,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 140,
                                      child: Image.network(
                                        controller
                                            .cartProductModel[index].image!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: controller
                                                .cartProductModel[index].name!,
                                            fontSize: 24,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomText(
                                            text:
                                                '\$${controller.cartProductModel[index].price.toString()}',
                                            fontSize: 24,
                                            color: primaryColor,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 140,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.grey.shade200,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: Colors.black,
                                                  ),
                                                  onTap: () {
                                                    controller.increaseQuantity(
                                                        index);
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                CustomText(
                                                  text:
                                                      '${controller.cartProductModel[index].quantity.toString()} ',
                                                  fontSize: 24,
                                                  color: Colors.black,
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                GestureDetector(
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10.0),
                                                    child: Icon(
                                                      Icons.minimize,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    if (controller
                                                            .cartProductModel[
                                                                index]
                                                            .quantity ==
                                                        0) {
                                                    } else {
                                                      controller
                                                          .decreaseQuantity(
                                                              index);
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 15,
                              );
                            },
                          ),
                        )),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const CustomText(
                                    text: 'TOTAL',
                                    fontSize: 22,
                                    color: Colors.grey,
                                  ),
                                  CustomText(
                                    text:
                                        '\$ ${controller.totalPrice.toString()}',
                                    fontSize: 30,
                                    color: primaryColor,
                                  ),
                                ],
                              ),
                              Container(
                                  padding: const EdgeInsets.all(20),
                                  width: 180,
                                  height: 100,
                                  child: CustomButton(
                                    onPress: () {
                                      Get.to(() => const CheckOutView());
                                    },
                                    text: 'CHECKOUT',
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
            ));
  }
}
