import 'package:ecommerce_application/constant/constant.dart';
import 'package:ecommerce_application/core/view_model/cart_view_model.dart';
import 'package:ecommerce_application/core/view_model/checkout_view_model.dart';
import 'package:ecommerce_application/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(builder: (controller) {
      return Column(
        children: [
          Container(
              height: 350,
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                itemCount: controller.cartProductModel.length,
                itemBuilder: (context, index) => SizedBox(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 180,
                        child: controller.cartProductModel[index].image == null
                            ? SvgPicture.asset('assets/images/no_data.svg')
                            : Image.network(
                                controller.cartProductModel[index].image!,
                                fit: BoxFit.fitWidth,
                              ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        text: TextSpan(children: [
                          TextSpan(
                              text: controller.cartProductModel[index].name,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 25)),
                        ]),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      CustomText(
                        color: primaryColor,
                        fontSize: 25,
                        text:
                            '\$ ${controller.cartProductModel[index].price ?? ''}',
                        alignment: Alignment.bottomLeft,
                      )
                    ],
                  ),
                ),
              )),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomText(
                  text: 'Shipping Address',
                  fontSize: 24,
                        
                ),
              ),
              GetBuilder< CheckOutViewModel>(builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text:
                        '${controller.street1 ?? ''}, ${controller.street2 ?? ''} ,${controller.city ?? ''} ,${controller.state ?? ''} ,${controller.zipCode ?? ''}, ${controller.country ?? ''} .' ,
                    fontSize: 20,
                    alignment: Alignment.bottomLeft,
                  ),
                );
              }),
        ],
      );
    });
  }
}
