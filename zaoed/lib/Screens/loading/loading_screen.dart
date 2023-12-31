import 'package:intl/intl.dart';
import 'package:zaoed/Screens/Finder/screens/NavigationBar/navigation_bar.dart';
import 'package:zaoed/blocs/card_bloc/card_bloc.dart';
import 'package:zaoed/constants/imports.dart';

import '../../blocs/charging_bloc/charging_bloc.dart';
import '../../blocs/finder_bloc/finder_bloc.dart';
import '../../blocs/google_map_bloc/google_map_bloc.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthStates>(
      buildWhen: (oldState, newState) {
        if (newState is CheckLoginState) {
          context.read<CardBloc>().add(GetCardDateEvent());
          context.read<FinderBloc>().add(LoadDataTimerEvent());
          context.read<ChargingBloc>().add(EmptyCarsEvent());
          context.read<GoogleMapBloc>().add(FetchMarkersEvent());
          if (newState.type == 'provider') {
            Future.delayed(const Duration(seconds: 4), () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NavigationBarScreen()),
                  (route) => false);
            });
          } else {
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FinderNavigationBarScreen()),
                  (route) => false);
            });
          }
        } else if (newState is ErrorCheckState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const TabBarLogin()),
              (route) => false);
        }
        return false;
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors().gray9,
          body: Center(
            child: Image.asset("lib/assets/images/ZaoedLogo.png"),
          ),
        );
      },
    );
  }
}
