import 'package:e_commerce_app_v2/core/constants/app_svg.dart';
import 'package:e_commerce_app_v2/view/widgets/custom_text.dart';
import 'package:e_commerce_app_v2/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) {
          return Scaffold(
            body: controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    padding: const EdgeInsets.only(top: 100),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Container(
                                    width: 120,
                                    height: 120,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                    ),
                                    child: controller.userModel == null
                                        ? Image.asset(
                                            'assets/images/user_avatar_image.png')
                                        : controller.userModel!.pic == 'default'
                                            ? Image.asset(
                                                'assets/images/user_avatar_image.png')
                                            : Image.network(
                                                controller.userModel!.pic)),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    CustomText(
                                        fontSize: 24,
                                        text: controller.userModel!.name!),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    CustomText(
                                        fontSize: 20,
                                        text: controller.userModel!.email)
                                  ],
                                ),

                              ],
                            ),

                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          ListTile(
                            onTap: () {},
                            title: const CustomText(
                                text: 'Edit Profile', fontSize: 14),
                            leading: SvgPicture.asset(AppSvg.editProfile),
                            trailing: const Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            onTap: () {},
                            title: const CustomText(
                                text: 'shipping Address', fontSize: 14),
                            leading: SvgPicture.asset(AppSvg.location),
                            trailing: const Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ListTile(
                              onTap: () {},
                              title: const CustomText(
                                  text: 'Order History', fontSize: 14),
                              leading:
                              SvgPicture.asset(AppSvg.orderHistory),
                              trailing: const Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            onTap: () {},
                            title: const CustomText(
                                text: 'Cards', fontSize: 14),
                            leading: SvgPicture.asset(AppSvg.cards),
                            trailing: const Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            onTap: () {},
                            title: const CustomText(
                                text: 'Notifications', fontSize: 14),
                            leading: SvgPicture.asset(AppSvg.note),
                            trailing: const Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                            ListTile(
                              onTap: () {},
                              title: const CustomText(
                                  text: 'Log Out', fontSize: 14),
                              leading: SvgPicture.asset(AppSvg.logout),
                              trailing: const Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
          );
        });
  }
}
