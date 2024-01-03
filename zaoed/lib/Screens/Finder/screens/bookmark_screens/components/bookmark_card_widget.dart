import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:zaoed/Screens/Finder/screens/Booking/widgets/booking_location_information.dart';
import 'package:zaoed/Screens/Finder/screens/bookmark_screens/bookmark_dialogs/add_bookmark_dialog.dart';
import 'package:zaoed/Screens/Finder/screens/bookmark_screens/bookmark_dialogs/remove_bookmark_dialog.dart';
import 'package:zaoed/Screens/Finder/screens/bookmark_screens/components/book_charge_button.dart';
import 'package:zaoed/Screens/Finder/screens/bookmark_screens/components/chargers_row_widget.dart';
import 'package:zaoed/Screens/Finder/screens/bookmark_screens/components/share_button_widget.dart';

import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';

class BookmarkCardWidget extends StatelessWidget {
  const BookmarkCardWidget({
    super.key,
    required this.pointName,
    required this.chargingPort,
    required this.rating,
    required this.chargingTimes,
    required this.portCount,
    required this.bookmarkID,
    required this.pointID,
    required this.longitude,
    required this.latitude,
  });

  final String? pointName, chargingPort;
  final double? rating, longitude, latitude;
  final int? chargingTimes, portCount, bookmarkID, pointID;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
      child: Container(
        height: 210,
        width: context.getWidth(),
        decoration: BoxDecoration(
            color: AppColors().gray1Trans,
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 13, right: 13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    pointName ?? "",
                    style: TextStyle(
                      color: AppColors().mainWhite,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset("lib/assets/icons/Star.png"),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "$rating",
                    style: TextStyle(
                      color: AppColors().mainWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "$chargingTimes",
                    style: TextStyle(
                      color: AppColors().gray4,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  RemoveBookMarkDialog(
                    bookmarkID: bookmarkID,
                  ),
                ],
              ),
              FutureBuilder(
                future: BookingLocationInformation()
                    .convertToCity(latitude, longitude),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: AppColors().green,
                    );
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return const Text("");
                  } else {
                    Placemark placemark = snapshot.data!.last;
                    return Text(
                      "${placemark.locality} ${placemark.subLocality}",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: AppColors().gray4,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ChargersRowWidget(
                portCount: portCount,
                chargingPort: chargingPort,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ShareButtonWidget(
                    onPress: () {},
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  BookChargeButton(
                    onPress: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
