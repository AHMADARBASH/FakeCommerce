abstract class BottomNavbarState {
  int index;
  BottomNavbarState({required this.index});
}

class BottomNavBarInitState extends BottomNavbarState {
  @override
  BottomNavBarInitState() : super(index: 0);
}

class BottomNavBarChangeIndexState extends BottomNavbarState {
  BottomNavBarChangeIndexState({required super.index});
}
