import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_cubit_state.dart';

class NavigationCubitCubit extends Cubit<NavigationState> {
  int _selectedIndex = 1;

  NavigationCubitCubit()
      : super(const NavigationState(NavbarItem.searchScreen, 1));

  get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
  }

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.gameScreen:
        emit(
          const NavigationState(NavbarItem.gameScreen, 0),
        );
        break;
      case NavbarItem.searchScreen:
        emit(
          const NavigationState(NavbarItem.searchScreen, 1),
        );
        break;
      case NavbarItem.homeSreen:
        emit(
          const NavigationState(NavbarItem.homeSreen, 2),
        );
        break;
      case NavbarItem.settingScreen:
        emit(
          const NavigationState(NavbarItem.settingScreen, 3),
        );
        break;
      case NavbarItem.userScreen:
        emit(
          const NavigationState(NavbarItem.userScreen, 4),
        );
        break;
    }
  }
}
