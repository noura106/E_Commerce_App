import 'package:e_commerce_app_v2/core/constants/contsants.dart';
import 'package:e_commerce_app_v2/core/constants/enum.dart';
import 'package:e_commerce_app_v2/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
 Delivery delivery =Delivery.standardDelivery;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height:30,),
        RadioListTile<Delivery>(
          activeColor: Constants.primaryColor,
          value: Delivery.standardDelivery,
          groupValue: delivery,
          onChanged: (value) {
            setState(() {
              delivery=value!;
            });
          },
          title: const CustomText(
            text: 'Standard Delivery',
            fontSize: 20,
          ),
          subtitle: const CustomText(text:'\n Order will be delivered between 3 - 5 business days' ,fontSize: 18,),
        ),
        const SizedBox(height: 30,),

        RadioListTile<Delivery>(
          activeColor: Constants.primaryColor,
          value: Delivery.nextDayDelivery,
          groupValue: delivery,
          onChanged: (value) {
            setState(() {
              delivery=value!;
            });
          },
          title: const CustomText(
            text: 'Next Day Delivery',
            fontSize: 20,
          ),
          subtitle: const CustomText(text:'\n Place your order before 6pm and your items will be delivered the next day' ,fontSize: 18,),
        ),
        const SizedBox(height: 30,),

        RadioListTile<Delivery>(
          activeColor: Constants.primaryColor,
          value: Delivery.nominatedDelivery,
          groupValue: delivery,
          onChanged: (value) {
            setState(() {
              delivery=value!;
            });
          },
          title: const CustomText(
            text: 'Nominated Delivery',
            fontSize: 20,
          ),
          subtitle: const CustomText(text:'\n Pick a particular date from the calendar and order will be delivered on selected date' ,fontSize: 18,),
        )
      ],
    );
  }
}
