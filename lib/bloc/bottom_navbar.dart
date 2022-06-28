import 'dart:async';

enum NavBarItem {
  home,
  favorite,
  plus,
  search,
  profile,
}

class BottomNavBarBloc {
  final StreamController<NavBarItem> _navBarController =
      StreamController<NavBarItem>.broadcast();

  NavBarItem defaultItem = NavBarItem.home;

  Stream<NavBarItem> get itemStream => _navBarController.stream;

  void pickItem(int item) {
    switch (item) {
      case 0:
        _navBarController.sink.add(NavBarItem.home);
        break;
      case 1:
        _navBarController.sink.add(NavBarItem.favorite);
        break;
      case 2:
        _navBarController.sink.add(NavBarItem.plus);
        break;
      case 3:
        _navBarController.sink.add(NavBarItem.search);
        break;
      case 4:
        _navBarController.sink.add(NavBarItem.profile);
        break;
    }
  }

  close() {
    _navBarController.close();
  }
}
