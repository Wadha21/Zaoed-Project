import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/methods_show_dialog/delete_charging_point_show_diialog.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';

AppBar AddChargingScreenAppBar(BuildContext context, {title}) {
  return AppBar(
    centerTitle: true,
    automaticallyImplyLeading: false,
    title: Text(
      title,
      style: TextStyle(color: AppColors().white, fontWeight: FontWeight.w700),
    ),
    backgroundColor: AppColors().gray9,
    actions: [
      TextButton(
          onPressed: () {
            DeleteChargingPointShowDialog(context);
            Future.delayed(const Duration(seconds: 2), () {
              context.pop();
            });
          },
          child: Text(
            'إلغاء',
            style: TextStyle(color: AppColors().white),
          ))
    ],
  );
}
