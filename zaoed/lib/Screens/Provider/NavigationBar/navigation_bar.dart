import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass/glass.dart';
import 'package:zaoed/Screens/Finder/screens/Profile/profile_screen.dart';
import 'package:zaoed/Screens/Finder/screens/bookmark_screens/saved_bookmarks_screen.dart';
import 'package:zaoed/Screens/Finder/screens/charging_statuse/charging_statuse_screen.dart';
import 'package:zaoed/Screens/Finder/screens/home/home_screen.dart';
import 'package:zaoed/Screens/Finder/screens/home/map_home_screen.dart';
import 'package:zaoed/Screens/Provider/Profile/profile_screen.dart';
import 'package:zaoed/blocs/auth_bloc/page_bloc/pages_bloc.dart';
import 'package:zaoed/blocs/finder/user_bloc/user_bloc.dart';
import 'package:zaoed/blocs/finder/user_bloc/user_event.dart';
import 'package:zaoed/constants/colors.dart';
class NavigationBarScreen extends StatelessWidget {
  NavigationBarScreen({super.key});
  final List screens = [
    const ProfileFinder(),
    const ProfileScreen(),
    const HomeScreen(),
    const ProfileScreen(),
  ];
  final List providerScreens = [
    SavedBookmarksScreen(),
    ProfileScreen(),
    const ProfileFinder(),
    const ProfileScreen(),
  ]; 
  final List finderScreens = [
    SavedBookmarksScreen(),
    ChargingStatuesScreen(),
    MapHomeScreen(),
    const ProfileFinder(),
  ];
  @override
  Widget build(BuildContext context) {
     context.read<UserBloc>().add(GetUserDataEvent());
    return BlocBuilder<PagesBloc, PagesState>(
      builder: (context, state) {
        if (state is PagesNavigationState) {
          return Scaffold(
            extendBody: true,
            body: screens[state.seleted],
            bottomNavigationBar: SizedBox(
              height: 64,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors().green,
                unselectedItemColor: AppColors().white,
                backgroundColor: Colors.transparent,
                currentIndex: state.seleted,
                onTap: (index) {
                  context.read<PagesBloc>().add(PageNavigationEvent(index));
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(
                      'lib/assets/icons/bookmarked.png',
                    )),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(
                      'lib/assets/icons/car.png',
                    )),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(
                      'lib/assets/icons/map.png',
                    )),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(
                        'lib/assets/icons/person.png',
                      ),
                      size: 29,
                    ),
                    label: '',
                  ),
                ],
              ).asGlass(
                tintColor: Colors.transparent,
              ),
            ),
          );
        }
        return Scaffold(
          extendBody: true,
          body: screens[2],
          bottomNavigationBar: SizedBox(
            height: 64,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors().green,
              unselectedItemColor: AppColors().white,
              backgroundColor: Colors.transparent,
              currentIndex: 2,
              onTap: (index) {
                context.read<PagesBloc>().add(PageNavigationEvent(index));
              },
              items: const [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    'lib/assets/icons/bookmarked.png',
                  )),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    'lib/assets/icons/car.png',
                  )),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    'lib/assets/icons/map.png',
                  )),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'lib/assets/icons/person.png',
                    ),
                    size: 29,
                  ),
                  label: '',
                ),
              ],
            ).asGlass(
              tintColor: Colors.transparent,
            ),
          ),
        );
      },
    );
  }
}