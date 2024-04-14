part of 'category_bloc.dart';

/// This state is loaded by default with empty list [] and initial state
class CategoryState extends Equatable {
  final List<Category> categoryList;
  final RequestState requestState;

  const CategoryState({
    this.categoryList = const [],
    this.requestState = RequestState.initial,
  });

  CategoryState copyWith({
    List<Category>? categoryList,
    RequestState? requestState,
  }) {
    return CategoryState(
      categoryList: categoryList ?? this.categoryList,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object?> get props => [categoryList, requestState];
}
