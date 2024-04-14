import 'dart:async';
import 'package:wahg_v1/di/injection_container.dart' as di;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/usecases/get_categories_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState()) {
    on<GetCategoryEvent>(_loadGetCategoryEvent);
  }

  FutureOr<void> _loadGetCategoryEvent(event, emit) async {
    emit(state.copyWith(requestState: RequestState.loading));
    final res = await GetCategoryUseCase(categoryRepository: di.sl.call())
        .getCategories();

    res.fold((failure) {
      emit(state.copyWith(requestState: RequestState.error));
    }, (List<Category> data) {
      print('1 Category is : ${state.categoryList}');
      emit(state.copyWith(categoryList: data, requestState: RequestState.done));
      print('2 Category is : ${state.categoryList}');
    });
  }
}
