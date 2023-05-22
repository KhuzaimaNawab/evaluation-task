part of 'navigation_cubit_cubit.dart';

enum NavbarItem { gameScreen, searchScreen, homeSreen, settingScreen, userScreen}

class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  const NavigationState(this.navbarItem, this.index);

  @override
  List<Object> get props => [navbarItem, index];
}


