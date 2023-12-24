import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zaoed/Screens/Finder/screens/Booking/booking_screen.dart';
import 'package:zaoed/Screens/Provider/NavigationBar/navigation_bar.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/add_charging_point.dart';
import 'package:zaoed/blocs/auth_bloc/auth_bloc.dart';
import 'package:zaoed/blocs/page_bloc/pages_bloc.dart';
import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';
import 'package:zaoed/blocs/user_bloc/user_bloc.dart';
import 'package:zaoed/service/networking.dart';

import 'Screens/Finder/screens/home/filter_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  SupabaseNetworking().getSupabaseInitialize;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ), BlocProvider(
          create: (context) => ProviderBloc(),
        ),
        BlocProvider(
          create: (context) => PagesBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: "SfArabic"),
        supportedLocales: const [
          Locale("ar"),
        ],
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: AddChargingPoint(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
