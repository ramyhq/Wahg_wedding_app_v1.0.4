import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/5.0_drawer_menu/models/navigation_menu_model.dart';

part 'drawer_event.dart';
part 'drawer_state.dart';

class DrawerBloc
    extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(DrawerState()) {
    on<DrawerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    DrawerInitialEvent event,
    Emitter<DrawerState> emit,
  ) async {
    emit(state.copyWith(
      toggleController: TextEditingController(),
    ));
  }
}
