import 'package:e_commerce_app_v2/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String assetName;
  final Function() onPress;
  const CustomButtonSocial({super.key,required this.text,required this.assetName,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return     Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey)
      ),
      child: TextButton(
          onPressed: onPress,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(assetName),
              const SizedBox(width: 90,),
               CustomText(
                text: text,
                fontSize: 16,
              ),
            ],
          )),
    );
  }
}
