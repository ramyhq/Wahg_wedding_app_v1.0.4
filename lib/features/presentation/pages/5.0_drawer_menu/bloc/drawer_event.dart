// ignore_for_file: must_be_immutable

part of 'drawer_bloc.dart';

@immutable
abstract class DrawerEvent extends Equatable {}

class DrawerInitialEvent extends DrawerEvent {
  @override
  List<Object?> get props => [];
}
