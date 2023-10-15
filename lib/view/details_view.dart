import 'package:ecommerce_application/core/view_model/cart_view_model.dart';
import 'package:ecommerce_application/model/product_model.dart';
import 'package:ecommerce_application/view/widgets/custom_button.dart';
import 'package:ecommerce_application/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../model/cart_product_model.dart';

class DetailsView extends StatelessWidget {
  final ProductModel model;

  const DetailsView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 270,
            child: Image.network(
              model.image!,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                CustomText(
                  text: model.name!,
                  fontSize: 26,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width * .4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const CustomText(
                            text: 'Size',
                          ),
                          CustomText(
                            text: model.sized!,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width * .44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const CustomText(
                            text: 'Color',
                          ),
                          Container(
                            width: 30,
                            height: 20,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                              color: model.color,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(
                  text: 'Details',
                  fontSize: 18,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    CustomText(
                      text: model.description!,
                      fontSize: 18,
                      height: 2.5,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const CustomText(
                      text: "PRICE ",
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                    CustomText(
                      text: ' \$${model.price!}',
                      color: primaryColor,
                      fontSize: 18,
                    )
                  ],
                ),
                GetBuilder<CartViewModel>(
                   
                    builder: (controller) => Container(
                          padding: const EdgeInsets.all(20),
                          width: 220,
                          height: 100,
                          child: CustomButton(
                            onPress: () {
                              controller.addProduct(CartProductModel(
                                  name: model.name,
                                  image: model.image,
                                  price: model.price,
                                  quantity: 1,
                                  productId: model.productId
                                  ));
                            },
                            text: 'Add',
                          ),
                        )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
