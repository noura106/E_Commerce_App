import 'package:e_commerce_app_v2/core/constants/contsants.dart';
import 'package:e_commerce_app_v2/view/product_details_view.dart';
import 'package:e_commerce_app_v2/view/widgets/custom_text.dart';
import 'package:e_commerce_app_v2/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<HomeViewModel> {
  List<String> names = ['men', 'women', 's', 's', 's'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) {
          return controller.loading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  body: Padding(
                    padding:
                        const EdgeInsets.only(top: 100, right: 20, left: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _searchHome(),
                          const SizedBox(
                            height: 30,
                          ),
                          const CustomText(
                            fontSize: 18,
                            text: 'Categories',
                          ),
                          _categoryListView(),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(fontSize: 18, text: 'Best Selling'),
                              CustomText(fontSize: 16, text: 'See All'),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _productsListView(),
                        ],
                      ),
                    ),
                  ),
                );
        });
  }

  Widget _searchHome() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
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

  Widget _categoryListView() {
    return GetBuilder<HomeViewModel>(builder: (_) {
      return SizedBox(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100),
                  child: Image.network(controller.categories[index].image),
                ),
                CustomText(
                    fontSize: 15, text: controller.categories[index].name)
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 20,
            );
          },
        ),
      );
    });
  }

  Widget _productsListView() {
    return GetBuilder<HomeViewModel>(
      builder: (_){
        return  SizedBox(
          height: 350,
          child: ListView.separated(
            itemCount: controller.products.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: ()=>Get.to(ProductDetailsView(productModel: controller.products[index])),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade100),
                        child: SizedBox(
                            height: 220,
                            child: Image.network(
                             controller.products[index].image,
                              fit: BoxFit.fill,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                       CustomText(
                        fontSize: 15,
                        text:  controller.products[index].name,
                        alignment: Alignment.bottomLeft,
                      ),
                      const SizedBox(height: 10),
                       Expanded(
                         child: CustomText(
                          fontSize: 15,
                          text:   controller.products[index].description,
                          alignment: Alignment.bottomLeft,
                          color: Colors.grey,
                      ),
                       ),
                       CustomText(
                          fontSize: 15,
                          text:   controller.products[index].price,
                          alignment: Alignment.bottomLeft,
                          color: Constants.primaryColor),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 20,
              );
            },
          ),
        );
      }
    );
  }
}
