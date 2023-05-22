import 'package:flutter/material.dart';

import '../../logic/blocs/navigation_cubit/navigation_cubit_cubit.dart';
import '../../theme/color_theme.dart';

class NavItem extends StatelessWidget {
  final NavigationState state;
  final int currentIndex;
  final NavbarItem navbarItem;
  final IconData icon;
  const NavItem({
    Key? key,
    required this.state,
    required this.currentIndex,
    required this.navbarItem,
    required this.icon,
    required this.navCubit,
  }) : super(key: key);

  final NavigationCubitCubit navCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: state.index == currentIndex ? 60 : 40,
      height: state.index == currentIndex ? 60 : 40,
      decoration: BoxDecoration(
        boxShadow: state.index == currentIndex
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  offset: Offset(-10, 0), // Offset for the left side
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  offset: Offset(10, 0), // Offset for the right side
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ]
            : null,
        shape: BoxShape.circle,
        gradient: state.index == currentIndex
            ? const LinearGradient(
                colors: [Color(0xFFFF7618), Color(0xFF131F3E)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : const LinearGradient(
                colors: [Colors.transparent, Colors.transparent],
              ),
      ),
      child: IconButton(
        onPressed: () {
          navCubit.setIndex(currentIndex);
          navCubit.getNavBarItem(navbarItem);
        },
        icon: Icon(
          icon,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
