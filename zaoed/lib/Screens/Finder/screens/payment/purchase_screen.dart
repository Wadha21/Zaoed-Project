import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Finder/screens/payment/widgets/payment_container.dart';
import 'package:zaoed/Screens/Finder/screens/payment/widgets/title_label.dart';
import 'package:zaoed/components/button_widget.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({
    super.key,
    required this.onTap,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(),
      height: context.getHeight() / 1.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleLabel(
            title: 'الدفع',
          ),
          const PaymentContainer(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ButtonWidget(
                textEntry: 'الحجز',
                backColor: AppColors().green,
                onPress: onTap,
                textColor: AppColors().white),
          ),
        ],
      ),
    );
  }
}

