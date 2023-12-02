import 'package:e_commerce_app_v2/core/constants/contsants.dart';
import 'package:e_commerce_app_v2/model/cart_product_model.dart';
import 'package:e_commerce_app_v2/model/product_model.dart';
import 'package:e_commerce_app_v2/view/widgets/custom_button.dart';
import 'package:e_commerce_app_v2/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/custom_text.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetailsView({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 270,
            child: Image.network(
              productModel.image,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomText(
                      text: productModel.name,
                      fontSize: 26,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                text: 'Size',
                                fontSize: 16,
                              ),
                              CustomText(
                                text: productModel.size,
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width * .44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CustomText(
                                text: 'Color',
                                fontSize: 16,
                              ),
                              Container(
                                width: 30,
                                height: 20,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20),
                                  color: productModel.color,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomText(
                      text: "Details",
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomText(fontSize: 18, text: productModel.description)
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const CustomText(
                      text: "PRICE ",
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                    CustomText(
                      text: ' \$${productModel.price}',
                      color: Constants.primaryColor,
                      fontSize: 18,
                    )
                  ],
                ),
                GetBuilder<CartViewModel>(
                  init: CartViewModel(),
                  builder: (controller){
                    return Container(
                      padding: EdgeInsets.all(20),
                      width: 150,
                      height: 100,
                      child: CustomButton(
                        onPress: () =>controller.addProductToCart(
                            CartProductModel(
                                productId: productModel.productId,
                                name: productModel.name,
                                image: productModel.image,
                                price: productModel.price,
                                quantity: 1)),
                        text: 'Add',
                      ),
                    );
    }
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
