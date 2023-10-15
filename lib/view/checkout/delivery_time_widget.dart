import 'package:ecommerce_application/constant/constant.dart';
import 'package:ecommerce_application/helper/enum.dart';
import 'package:ecommerce_application/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatelessWidget {
  const DeliveryTime({super.key});
  final Delivery delivery = Delivery.standardDelivery;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile<Delivery>(
          contentPadding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
          value: Delivery.standardDelivery,
          groupValue: delivery,
          onChanged: (Delivery? value) {},
          title: const CustomText(
            text: 'Standard Delivery',
            fontSize: 24,
          ),
          subtitle: const CustomText(
            text: '\nOrder will be delivered between 3 - 5 business days',
            fontSize: 18,
            maxLine: 4,
            alignment: Alignment.topLeft,
          ),
          activeColor: primaryColor,
        ),
        const SizedBox(
          height: 20,
        ),
        RadioListTile<Delivery>(
          contentPadding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
          value: Delivery.nextDayDelivery,
          groupValue: delivery,
          onChanged: (Delivery? value) {},
          title: const CustomText(
            text: 'Next Day Delivery',
            fontSize: 24,
          ),
          subtitle: const CustomText(
            text:
                '\nPlace your order before 6pm and your items will be delivered the next day',
            fontSize: 18,
            maxLine: 4,
          ),
          activeColor: primaryColor,
        ),
        const SizedBox(
          height: 20,
        ),
        RadioListTile<Delivery>(
          contentPadding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
          value: Delivery.nominatedDelivery,
          groupValue: delivery,
          onChanged: (Delivery? value) {},
          title: const CustomText(
            text: 'Nominated Delivery',
            fontSize: 24,
          ),
          subtitle: const CustomText(
            text:
                '\nPick a particular date from the calendar and order will be delivered on selected date',
            fontSize: 18,
            maxLine: 5,
          ),
          activeColor: primaryColor,
        ),
      ],
    );
  }
}
