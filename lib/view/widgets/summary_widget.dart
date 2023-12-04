import 'package:e_commerce_app_v2/core/constants/contsants.dart';
import 'package:e_commerce_app_v2/view/widgets/custom_text.dart';
import 'package:e_commerce_app_v2/view_model/cart_view_model.dart';
import 'package:e_commerce_app_v2/view_model/check_out_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      builder: (controller) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 350,
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: ListView.separated(
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    height: 180,
                    child: Image.network(
                      controller.cartProducts[index].image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  RichText(
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          text: controller.cartProducts[index].name,
                          style: const TextStyle(color: Colors.black))),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: '\$${controller.cartProducts[index].price}',
                    fontSize: 16,
                    color: Constants.primaryColor,
                  ),
                ],
              ),
              itemCount: controller.cartProducts.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 20,
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomText(
              fontSize: 24,
              text: 'Shipping Address',
            ),
          ),
          GetBuilder<CheckOutViewModel>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                  fontSize: 20,
                  color: Colors.grey,
                  text:
                      '${controller.street1}, ${controller.street2} , ${controller.state} ,  ${controller.city} , ${controller.country}'),
            );
          }),
        ],
      ),
    );
  }
}
