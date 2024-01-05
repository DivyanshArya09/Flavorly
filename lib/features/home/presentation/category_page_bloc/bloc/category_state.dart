part of 'category_bloc.dart';

enum CategoryStatus { initial, loading, success, error }

enum CategoryFailure { server, connection, firebase, unknown }

class CategoryState extends Equatable {
  final CategoryStatus status;
  final CategoryFailure? failure;
  final List<CategoryEntity>? categoryResults;
  final String? category;

  const CategoryState(
      {this.status = CategoryStatus.initial,
      this.failure,
      this.categoryResults,
      this.category = ''});

  CategoryState copyWith({
    CategoryStatus? status,
    CategoryFailure? failure,
    List<CategoryEntity>? categoryResults,
    String? category,
  }) {
    return CategoryState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      categoryResults: categoryResults ?? this.categoryResults,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [status, failure, categoryResults, category];
}
