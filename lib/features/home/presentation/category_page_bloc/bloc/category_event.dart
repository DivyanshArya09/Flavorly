part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetCategoryEvent extends CategoryEvent {
  final String category;

  const GetCategoryEvent({required this.category});

  @override
  List<Object> get props => [category];
}
