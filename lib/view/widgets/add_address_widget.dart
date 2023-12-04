import 'package:e_commerce_app_v2/view/widgets/custom_text.dart';
import 'package:e_commerce_app_v2/view/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app_v2/view_model/check_out_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GetBuilder<CheckOutViewModel>(
        builder:(controller){
          return Form(
            key: controller.globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: 'Billing address is the same as delivery address',
                  fontSize: 16,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  onSave: (value) {
                    controller.street1=value!;
                  },
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'you must write your street1';
                    }
                  },
                  text: 'Street1',
                  hint: '21, Alex Davidson Avenue',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  onSave: (value) {
                    controller.street2=value!;
                  },
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'you must write your street2';
                    }
                  },
                  text: 'Street2',
                  hint: 'Opposite Omegatron, Vicent Quarters',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  onSave: (value) {
                    controller.city=value!;
                  },
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'you must write your city';
                    }
                  },
                  text: 'City',
                  hint: 'Victoria Island',
                ),
                SizedBox(
                  width: Get.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: CustomTextFormField(
                            onSave: (value) {
                              controller.state=value!;
                            },
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'you must write your state';
                              }
                            },
                            text: 'State',
                            hint: 'Lagos State',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: CustomTextFormField(
                            onSave: (value) {
                              controller.country=value!;
                            },
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'you must write your Country';
                              }
                            },
                            text: 'Country',
                            hint: 'Nigeria',
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
