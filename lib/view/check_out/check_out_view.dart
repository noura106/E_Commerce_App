import 'package:e_commerce_app_v2/core/constants/contsants.dart';
import 'package:e_commerce_app_v2/core/constants/enum.dart';
import 'package:e_commerce_app_v2/view/widgets/add_address_widget.dart';
import 'package:e_commerce_app_v2/view/widgets/custom_button.dart';
import 'package:e_commerce_app_v2/view/widgets/delivery_time_widget.dart';
import 'package:e_commerce_app_v2/view/widgets/summary_widget.dart';
import 'package:e_commerce_app_v2/view_model/check_out_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';

class CheckOutView extends StatelessWidget {
  final _processes = [
    'Delivery',
    'Address',
    'Summer',
  ];

  final _content = [
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
        init: CheckOutViewModel(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: const Text(
                "Check out",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                    width: Get.width,
                    child: StatusChange.tileBuilder(
                      theme: StatusChangeThemeData(
                        direction: Axis.horizontal,
                        connectorTheme:
                            const ConnectorThemeData(space: 1.0, thickness: 1.0),
                      ),
                      builder: StatusChangeTileBuilder.connected(
                        itemWidth: (_) =>
                            MediaQuery.of(context).size.width / _processes.length,
                        contentWidgetBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              _processes[index],
                              style: const TextStyle(
                                color: Constants.inProgressColor, // change color with dynamic color --> can find it with example section
                              ),
                            ),
                          );
                        },
                        nameWidgetBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              _content[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: controller.getColor(index),
                              ),
                            ),
                          );
                        },
                        indicatorWidgetBuilder: (_, index) {
                          if (index <= controller.index) {
                            return DotIndicator(
                              size: 35.0,
                              border: Border.all(color: Colors.teal, width: 1),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const OutlinedDotIndicator(
                              size: 30,
                              borderWidth: 1.0,
                              color: Constants.todoColor,
                            );
                          }
                        },
                        lineWidgetBuilder: (index) {
                          if (index > 0) {
                            if (index == controller.index) {
                              final prevColor = controller.getColor(index - 1);
                              return DecoratedLineConnector(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      prevColor,
                                      controller.getColor(index + 1)
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return SolidLineConnector(
                                color: controller.getColor(index),
                              );
                            }
                          } else {
                            return Container();
                          }
                        },
                        itemCount: _processes.length,
                      ),
                    ),
                  ),
                  controller.pages == Pages.deliveryTime
                      ? DeliveryTime()
                      : controller.pages == Pages.addAddress
                          ? const AddAddress()
                          : const Summary(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      controller.index==0? const Offstage(): Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            padding: EdgeInsets.all(20),
                            width: 170,
                            child: CustomButton(
                              color: Colors.white,
                                textColor: Constants.primaryColor,
                                text: 'Back',
                                onPress: () =>
                                    controller.changeIndex(controller.index + 1))),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: EdgeInsets.all(20),
                            width: 170,
                            child: CustomButton(
                              text: 'NEXT',
                                onPress: () =>
                                    controller.changeIndex(controller.index + 1))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
