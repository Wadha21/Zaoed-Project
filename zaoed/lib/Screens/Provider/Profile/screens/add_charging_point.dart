import 'package:zaoed/Screens/Provider/Profile/methods_show_dialog/add_charging_point_show_dialog.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/AppBar/add_charging_app_bar.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/availability_hours.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/chargeing_type_section.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/charging_point_location.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/charging_point_text_field.dart';
import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';
import 'package:zaoed/constants/imports.dart';

// ignore: must_be_immutable
class AddChargingPoint extends StatelessWidget {
  AddChargingPoint({super.key});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProviderBloc>();

    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: AddChargingScreenAppBar(context, title: 'إضافة نقطة شحن'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              AddChargingPointTextField(textController: controller),
              ChargingPointLocation(
                bloc: bloc,
              ),
              AvailabilityHours(
                bloc: bloc,
              ),
              // How to get it using count?? there is a count for each port type
              const ChargingTypeSection(),
              const SizedBox(
                height: 8,
              ),
              ButtonWidget(
                  textEntry: "إضافة",
                  backColor: AppColors().green,
                  onPress: () {
                    context.read<ProviderBloc>().add(AddChargingPointEvent(
                        // edit and add the  charging type from the bloc
                        controller.text,
                        bloc.selectedHour,
                        bloc.pinLongitude,
                        bloc.pinLatitude));
                    AddChargingPointShowDialog(context);
                    Future.delayed(const Duration(seconds: 2), () {
                      context.pop();
                    });
                  },
                  textColor: AppColors().white)
            ],
          ),
        ),
      ),
    );
  }
}
