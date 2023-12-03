import 'package:e_commerce_app_v2/core/constants/app_svg.dart';
import 'package:e_commerce_app_v2/core/constants/contsants.dart';
import 'package:e_commerce_app_v2/view/check_out/check_out_view.dart';
import 'package:e_commerce_app_v2/view/widgets/custom_button.dart';
import 'package:e_commerce_app_v2/view/widgets/custom_text.dart';
import 'package:e_commerce_app_v2/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
        builder: (controller) {
      return controller.cartProducts.isNotEmpty? Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: controller.cartProducts.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 140,
                  child: Row(
                    children: [
                      SizedBox(
                          width: 140,
                          child: Image.network(
                            controller.cartProducts[index].image,
                            fit: BoxFit.fill,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width:170,
                                child: CustomText(
                                    text: controller.cartProducts[index].name,
                                    fontSize: 20),
                              ),
                            ),
                             const SizedBox(
                              height: 6,
                            ),
                            CustomText(
                              text: '\$${controller.cartProducts[index].price}',
                              fontSize: 16,
                              color: Constants.primaryColor,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GetBuilder<CartViewModel>(
                              builder:(_){
                                return Container(
                                  width: 150,
                                  height: 40,
                                  color: Colors.grey.shade200,
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                       IconButton(
                                         icon: const Icon(   Icons.add,
                                    color: Colors.black,
                                  ),
                                onPressed: ()=> controller.increaseQuantity(index),),

                                      const SizedBox(
                                        width: 20,
                                      ),
                                      CustomText(
                                        fontSize: 20,
                                        text: '${controller.cartProducts[index].quantity}',
                                        alignment: Alignment.center,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 50),
                                        child: IconButton(
                                        icon:const Icon(Icons.minimize,   color: Colors.black,) ,
                                          onPressed: ()=> controller.decreaseQuantity(index),

                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 15,
                );
              },
            ),
          ),
      Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const CustomText(
                            fontSize: 16,
                            text: 'TOTAL ',
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomText(fontSize: 18, text: '\$${controller.totalPrice}'),
                        ],
                      ),
                      Container(
                          height: 100,
                          padding: const EdgeInsets.all(20),
                          width: 180,
                          child: CustomButton(
                            onPress: () => Get.to(CheckOutView()),
                            text: 'CHECKOUT',
                          ))
                    ],
                  ),

      )
        ],
      ): Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppSvg.cartEmpty,width: 200,height: 200,),
          SizedBox(height: 20,),
          const CustomText(fontSize: 22, text: 'Cart is Empty',alignment: Alignment.topCenter,)
        ],
      );
    });
  }
}
