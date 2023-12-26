import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/daily_hours_rate_chart.dart';
import 'package:zaoed/blocs/providor_bloc/static_bloc/static_bloc.dart';
import 'package:zaoed/constants/colors.dart';

class DailyHoursRateChartContainer extends StatelessWidget {
  const DailyHoursRateChartContainer({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    final dailyhour = context.read<StaticBloc>();
    return SizedBox(
      height: 304,
      width: 350,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Text(
              subTitle,
              style: TextStyle(color: AppColors().white, fontSize: 16),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            DailyHoursRateChart(data: [
              DataPoint(date: 'الأحد', hoursRate: dailyhour.dailyHour?[1] ?? 0),
              DataPoint(
                  date: 'الأثنين', hoursRate: dailyhour.dailyHour?[2] ?? 0),
              DataPoint(
                  date: 'الثلاثاء', hoursRate: dailyhour.dailyHour?[3] ?? 0),
              DataPoint(
                  date: 'الأربعاء', hoursRate: dailyhour.dailyHour?[4] ?? 0),
              DataPoint(
                  date: 'الخميس', hoursRate: dailyhour.dailyHour?[5] ?? 0),
              DataPoint(
                  date: 'الجمعة', hoursRate: dailyhour.dailyHour?[6] ?? 0),
              DataPoint(date: 'السبت', hoursRate: dailyhour.dailyHour?[0] ?? 0),
            ]),
          ],
        ),
      ),
    );
  }
}
