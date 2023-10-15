import 'package:ecommerce_application/constant/constant.dart';
import 'package:ecommerce_application/core/view_model/home_view_model.dart';
import 'package:ecommerce_application/view/details_view.dart';
import 'package:ecommerce_application/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.put(HomeViewModel()),
      builder: (controller) => controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Column(
                    children: [
                      _searchTextFormField(),
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomText(
                        text: "Categories",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _listViewCategory(),
                      const SizedBox(
                        height: 30,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Best Selling",
                            fontSize: 18,
                          ),
                          CustomText(
                            text: "See all",
                            fontSize: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      _listViewProducts(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => SizedBox(
              height: 105,
              child: ListView.separated(
                itemCount: controller.categoryModel.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade100,
                        ),
                        height: 60,
                        width: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                              controller.categoryModel[index].image),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: controller.categoryModel[index].name,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
              ),
            ));
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(builder: (controller) {
      return SizedBox(
        height: 430,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailsView(
                  model: controller.productModel[index],
                ));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      child: SizedBox(
                          height: 220,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Image.network(
                            controller.productModel[index].image!,
                            fit: BoxFit.fill,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.productModel[index].name!,
                      alignment: Alignment.bottomLeft,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: controller.productModel[index].description!,
                      color: Colors.grey,
                      alignment: Alignment.bottomLeft,
                      maxLine: 4,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text:
                          " ${controller.productModel[index].price.toString()} \$",
                      color: primaryColor,
                      alignment: Alignment.bottomLeft,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
        ),
      );
    });
  }
}
