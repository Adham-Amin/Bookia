import 'package:bookia/core/models/book_response.dart';
import 'package:bookia/core/services/api_service.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> getSearchResult({required String query});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiService apiService;
  SearchRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> getSearchResult({required String query}) async {
    var response = await apiService.get(
      endPoint: '/products-search?name=$query',
    );
    final books = response['data']['products'];
    List<BookEntity> booksList = [];
    for (var book in books) {
      booksList.add(BookResponse.fromJson(book).toEntity());
    }
    return booksList;
  }
}
