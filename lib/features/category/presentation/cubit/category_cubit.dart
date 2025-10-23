import 'package:bookia/features/category/domain/repo/category_repo.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.categoryRepo}) : super(CategoryInitial());

  final CategoryRepo categoryRepo;

  Future<void> getBookByCategory({required num id}) async {
    emit(CategoryLoading());
    final result = await categoryRepo.getBookByCategory(id: id);
    result.fold(
      (failure) => emit(CategoryError(message: failure.message)),
      (books) => emit(CategoryLoaded(books: books)),
    );
  }
}
