import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Finder/screens/charging_statuse/widgets/empty_charging_car.dart';
import 'package:zaoed/constants/colors.dart';

class EmptyChargingCarScreen extends StatelessWidget {
  const EmptyChargingCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const EmptyChargingCar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 151),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'لا توجد عملية شحن للسيارة!',
                  style: TextStyle(color: AppColors().gray, fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'للبدء في عملية شحن جديدة، يرجى البحث عن نقطة شحن',
                  style: TextStyle(
                    color: AppColors().gray,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
