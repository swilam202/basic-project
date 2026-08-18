part of 'layout_cubit.dart';

abstract class LayoutState {}

class LayoutInitial extends LayoutState {}

class NavigationState extends LayoutState {
  final int currentIndex;
  NavigationState(this.currentIndex);
}
