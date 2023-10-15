import 'package:ecommerce_application/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/view_model/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            )
          : Scaffold(
              body: Container(
              padding: const EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: (controller.userModel == null)
                                        ? const AssetImage(
                                            "assets/images/chair.png")
                                        : controller.userModel!.image ==
                                                "default"
                                            ? const AssetImage(
                                                "assets/images/Image.png")
                                            : const NetworkImage(
                                                    "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg")
                                                as ImageProvider,
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                CustomText(
                                  text: controller.userModel?.name != null
                                      ? controller.userModel!.name!
                                      : "User Name",
                                  color: Colors.black,
                                  fontSize: 23,
                                  maxLine: 1,
                                  alignment: Alignment.center,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 220,
                                  child: CustomText(
                                    text: controller.userModel?.email != null
                                        ? controller.userModel!.email!
                                        : "User Email",
                                    color: Colors.black,
                                    fontSize: 18,
                                    maxLine: 1,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    buildProperties(
                      title: "Edit Profile",
                      iconLeading: Icons.edit,
                      iconTrailing: Icons.arrow_forward_ios,
                      onTap: () {},
                    ),
                    buildProperties(
                      title: "Shipping Address",
                      iconLeading: Icons.location_on,
                      iconTrailing: Icons.arrow_forward_ios,
                      onTap: () {},
                    ),
                    buildProperties(
                      title: "Order History",
                      iconLeading: Icons.history,
                      iconTrailing: Icons.arrow_forward_ios,
                      onTap: () {},
                    ),
                    buildProperties(
                      title: "Cards",
                      iconLeading: Icons.credit_card,
                      iconTrailing: Icons.arrow_forward_ios,
                      onTap: () {},
                    ),
                    buildProperties(
                      title: "Notifications",
                      iconLeading: Icons.notifications,
                      iconTrailing: Icons.arrow_forward_ios,
                      onTap: () {},
                    ),
                    buildProperties(
                      title: "Log Out",
                      iconLeading: Icons.logout,
                      iconTrailing: Icons.arrow_forward_ios,
                      color: Colors.red,
                      onTap: () {
                        controller.signOut();
                      },
                    ),
                  ],
                ),
              ),
            )),
    );
  }

  Widget buildProperties(
      {required String title,
      required IconData iconLeading,
      required IconData iconTrailing,
      Color? color,
      required Function onTap}) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {
            onTap();
          },
          child: ListTile(
            leading: Icon(
              iconLeading,
              color: color,
            ),
            title: CustomText(
              text: title,
              color: color ?? Colors.black,
              fontSize: 20,
            ),
            trailing: Icon(iconTrailing, color: color),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
