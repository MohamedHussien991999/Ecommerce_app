import 'package:ecommerce_application/constant/constant.dart';
import 'package:ecommerce_application/core/view_model/checkout_view_model.dart';
import 'package:ecommerce_application/view/checkout/add_address_widget.dart';
import 'package:ecommerce_application/view/checkout/delivery_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_button.dart';
import 'summary_widget.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
        init: CheckOutViewModel(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: const Text(
                "Check Out",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Theme(
                    data: ThemeData(
                        canvasColor: Colors.white, fontFamily: 'SourceSans'),
                    child: Stepper(
                      elevation: 0.0,
                      connectorThickness: 2.0,
                      controlsBuilder: (context, ControlsDetails controls) {
                        return const SizedBox(
                          height: 0,
                          width: 0,
                        );
                      },
                      connectorColor: MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.disabled)) {
                          return todoColor; // Color when the connector is disabled
                        }
                        return Colors
                            .green; // Color when the connector is enabled
                      }),
                      type: StepperType.horizontal,
                      currentStep: controller.processIndex,
                      onStepTapped: (int index) {
                        controller.changeIndex(index);
                      },
                      steps: <Step>[
                        Step(
                            label: const Text('Delivery'),
                            isActive: controller.processIndex >= 0,
                            title: const Text(
                              '',
                            ),
                            content: const DeliveryTime()),
                        Step(
                            label: const Text('Address'),
                            isActive: controller.processIndex >= 1,
                            title: const Text(''),
                            content: const AddAddress()),
                        Step(
                            label: const Text('Summary'),
                            isActive: controller.processIndex == 2,
                            title: const Text(''),
                            content: const SummaryWidget()),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    controller.processIndex == 0
                        ? Container()
                        : Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 200,
                              height: 100,
                              padding: const EdgeInsets.all(20.0),
                              child: CustomButton(
                                color: Colors.white,
                                textColor: primaryColor,
                                text: 'Back',
                                onPress: () {
                                  controller.changePages(
                                      (controller.processIndex - 1));
                                },
                              ),
                            ),
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 200,
                        height: 100,
                        padding: const EdgeInsets.all(20.0),
                        child: CustomButton(
                          text: 'Next',
                          onPress: () {
                            controller
                                .changePages((controller.processIndex + 1));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
