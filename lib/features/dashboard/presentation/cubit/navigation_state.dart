import 'package:equatable/equatable.dart';

import '../../constants/nav_bar_items.dart';

class NavigationState extends Equatable {
  final NavBarItems items;
  final int index;
  const NavigationState(this.items, this.index);
  @override
  List<Object?> get props => [items, index];
}
