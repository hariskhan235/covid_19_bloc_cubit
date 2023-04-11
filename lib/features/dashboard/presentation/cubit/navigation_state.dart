import 'package:equatable/equatable.dart';
import '../../constants/nav_bar_items.dart';

// ignore: must_be_immutable
class NavigationState extends Equatable {
  final NavBarItems items;
  int index;
  NavigationState(this.items, this.index);
  @override
  List<Object?> get props => [items, index];
}
