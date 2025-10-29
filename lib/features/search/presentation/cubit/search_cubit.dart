import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:bookia/features/search/domain/repo/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> searchBooks({required String query}) async {
    emit(SearchLoading());
    final result = await searchRepo.searchBooks(query: query);
    result.fold(
      (l) => emit(SearchError(message: l.message)),
      (r) => emit(SearchSuccess(books: r)),
    );
  }
}
