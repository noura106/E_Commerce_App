import 'package:e_commerce_app_v2/core/constants/app_svg.dart';
import 'package:e_commerce_app_v2/core/constants/contsants.dart';
import 'package:e_commerce_app_v2/view/auth/register_view.dart';
import 'package:e_commerce_app_v2/view/widgets/custom_button.dart';
import 'package:e_commerce_app_v2/view/widgets/custom_button_social.dart';
import 'package:e_commerce_app_v2/view/widgets/custom_text.dart';
import 'package:e_commerce_app_v2/view/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app_v2/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: 'Welcome',
                    fontSize: 30,
                  ),
                  GestureDetector(
                    onTap: ()=>Get.to(const RegisterView()),
                    child: const CustomText(
                        text: 'Sign Up',
                        fontSize: 18,
                        color: Constants.primaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                fontSize: 14,
                text: 'Sign in to Continue',
                color: Colors.grey,
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: controller.loginKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      onSave: (value) {
                        controller.email=value!;
                      },
                      validator: (value) {
                        if(value==null){
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
                        controller.password=value!;
                      },
                      validator: (value) {
                        if(value==null){
                          print('Error');
                        }
                      },
                      text: 'Password',
                      hint: '*********',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomText(
                      text: 'Forget Password?',
                      fontSize: 14,
                      color: Colors.grey,
                      alignment: Alignment.topRight,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onPress: () {
                        controller.loginKey.currentState!.save();
                        if(controller.loginKey.currentState!.validate()){
                          controller.signInWithEmailAndPassword();
                        }

                      },
                      text: 'Sign In',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(
                      text: '-OR',
                      fontSize: 18,
                      alignment: Alignment.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButtonSocial(
                        text: 'Sign In With Google',
                        assetName: AppSvg.google,
                        onPress: () => controller.signInWithGoogleMethod()),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtonSocial(
                      text: 'Sign In With FaceBook',
                      assetName: AppSvg.faceBook,
                      onPress: () =>controller.signInWithFaceBook(),
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
