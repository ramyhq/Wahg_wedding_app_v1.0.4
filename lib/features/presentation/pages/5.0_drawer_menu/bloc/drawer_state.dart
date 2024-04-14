// ignore_for_file: must_be_immutable

part of 'drawer_bloc.dart';

class DrawerState extends Equatable {


  TextEditingController? toggleController;

  DrawerIM? drawerIM;
  DrawerState({
    this.toggleController,
    this.drawerIM,
  });
  DrawerState copyWith({
    TextEditingController? toggleController,
    DrawerIM? drawerIM,
  }) {
    return DrawerState(
      toggleController: toggleController ?? this.toggleController,
      drawerIM:
          drawerIM ?? this.drawerIM,
    );
  }

  @override
  List<Object?> get props => [
    toggleController,
    drawerIM,
  ];
}
