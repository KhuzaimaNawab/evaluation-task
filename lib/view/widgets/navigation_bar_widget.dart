import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:line_icons/line_icons.dart';

import '../../logic/blocs/navigation_cubit/navigation_cubit_cubit.dart';
import 'navigation_bar_item_widget.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navCubit = BlocProvider.of<NavigationCubitCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Neumorphic(
        style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
            depth: 1,
            lightSource: LightSource.top,
            color: Colors.transparent),
        child: BlocBuilder<NavigationCubitCubit, NavigationState>(
          builder: ((context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavItem(
                    state: state,
                    currentIndex: 0,
                    navbarItem: NavbarItem.gameScreen,
                    icon: LineIcons.gamepad,
                    navCubit: navCubit,
                  ),
                  NavItem(
                    state: state,
                    currentIndex: 1,
                    navbarItem: NavbarItem.searchScreen,
                    icon: LineIcons.search,
                    navCubit: navCubit,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: state.index == 2
                          ? const EdgeInsets.all(14.0)
                          : const EdgeInsets.all(0),
                      child: GestureDetector(
                        onTap: () {
                          navCubit.setIndex(2);
                          navCubit.getNavBarItem(NavbarItem.homeSreen);
                        },
                        child:
                            Image.asset('assets/logo.png', fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  NavItem(
                      state: state,
                      currentIndex: 3,
                      navbarItem: NavbarItem.settingScreen,
                      icon: LineIcons.cog,
                      navCubit: navCubit),
                  NavItem(
                      state: state,
                      currentIndex: 4,
                      navbarItem: NavbarItem.userScreen,
                      icon: LineIcons.user,
                      navCubit: navCubit),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
