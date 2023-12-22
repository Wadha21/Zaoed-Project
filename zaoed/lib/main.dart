import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zaoed/Provider/Screens/NavigationBar/navigation_bar.dart';
import 'package:zaoed/auth/tabbar_login_screen.dart';
import 'package:zaoed/auth/tabviews/login_screen.dart';
import 'package:zaoed/blocs/auth_bloc/auth_bloc.dart';
import 'package:zaoed/blocs/page_bloc/pages_bloc.dart';
import 'package:zaoed/finder/screens/Booking/booking_screen.dart';
import 'package:zaoed/onboarding/onboarding_screen.dart';
import 'package:zaoed/service/networking.dart';
import 'package:zaoed/bookmark_screens/saved_bookmarks_screen.dart';
import 'package:zaoed/customer_service_chat/chat_screen.dart';
import 'package:zaoed/finder/screens/Booking/booking_screen.dart';
import 'package:zaoed/finder/screens/Booking/scan_screen/scan_screen.dart';
import 'package:zaoed/finder/screens/payment/payment_process_screen.dart';
import 'package:zaoed/finder/screens/payment/purchase_screen.dart';
import 'package:zaoed/home/map_home_screen.dart';

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
        home: OnboradingScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
