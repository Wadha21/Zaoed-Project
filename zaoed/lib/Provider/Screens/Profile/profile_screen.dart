import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/AppBar/information_app_bar.dart';
import 'package:zaoed/Provider/Screens/Profile/widgets/PersonalInformation/about_us_information.dart';
import 'package:zaoed/Provider/Screens/Profile/widgets/PersonalInformation/payment_information.dart';
import 'package:zaoed/Provider/Screens/Profile/widgets/PersonalInformation/provider_information.dart';
import 'package:zaoed/Provider/Screens/Profile/widgets/PersonalInformation/public_sittings.dart';
import 'package:zaoed/Provider/Screens/Profile/widgets/PersonalInformation/social_media_information.dart';
import 'package:zaoed/Provider/Screens/Profile/widgets/information_title.dart';
import 'package:zaoed/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: ProfailAppBar(context),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InformationTitle(
                title: 'بياناتي',
              ),
              ProviderInformation(),
              InformationTitle(
                title: 'عام',
              ),
              PublicSittings(),
              InformationTitle(
                title: 'الدفع',
              ),
              PaymentInformation(),
              InformationTitle(
                title: 'عن تطبيق زوّد',
              ),
              AboutUsInformation(),
              SizedBox(
                height: 32,
              ),
              SocialMediaInformation()
            ],
          ),
        ),
      ),
    );
  }
}
