import 'package:e_commerce_app_v2/core/constants/contsants.dart';
import 'package:e_commerce_app_v2/view/widgets/custom_button.dart';
import 'package:e_commerce_app_v2/view/widgets/custom_text.dart';
import 'package:e_commerce_app_v2/view/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app_v2/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(icon:const Icon(Icons.arrow_back,color: Colors.black),onPressed: ()=>Get.back()),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: 'Sign Up',
                      fontSize: 30,
                      color: Colors.black),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: controller.registerKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      onSave: (value) {
                        controller.name = value!;
                      },
                      validator: (value) {
                        if (value == null) {
                          print('error');
                        }
                      },
                      text: 'Name',
                      hint: 'enter your name',
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextFormField(
                      onSave: (value) {
                        controller.email = value!;
                      },
                      validator: (value) {
                        if (value == null) {
                          print('error');
                        }
                      },
                      text: 'Email',
                      hint: 'nourkh@gmail.com',
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextFormField(
                      onSave: (value) {
                        controller.password = value!;
                      },
                      validator: (value) {
                        if (value == null) {
                          print('Error');
                        }
                      },
                      text: 'Password',
                      hint: '*********',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onPress: () {
                        controller.registerKey.currentState!.save();
                        if (controller.registerKey.currentState!.validate()) {
                          controller.createAccountWithEmailAndPassword();
                        }
                      },
                      text: 'Sign Up',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
