import 'package:evaluation/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:evaluation/view/widgets/navigation_bar_widget.dart';

import '../../logic/blocs/navigation_cubit/navigation_cubit_cubit.dart';
import 'game_screen.dart';
import 'home_page.dart';
import 'search_screen.dart';
import 'setting_screen.dart';
import 'user_screen.dart';

class RenderScreen extends StatelessWidget {
  const RenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<NavigationCubitCubit, NavigationState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.gameScreen) {
            return const GameScreen();
          } else if (state.navbarItem == NavbarItem.searchScreen) {
            return const SearchScreen();
          } else if (state.navbarItem == NavbarItem.homeSreen) {
            return const HomePage();
          } else if (state.navbarItem == NavbarItem.settingScreen) {
            return const SettingScreen();
          } else if (state.navbarItem == NavbarItem.userScreen) {
            return const UserScreen();
          } else {
            return const HomePage();
          }
        },
      ),
      bottomNavigationBar: const NavBarWidget(),
    );
  }
}
