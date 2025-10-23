part of 'category_cubit.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  final List<BookEntity> books;
  CategoryLoaded({required this.books});
}

final class CategoryError extends CategoryState {
  final String message;
  CategoryError({required this.message});
}
