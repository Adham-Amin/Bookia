import 'package:bookia/core/models/book_response.dart';
import 'package:bookia/core/services/api_service.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';

abstract class CategoryRemoteDataSource {
  Future<List<BookEntity>> getBookCategories({required num id});
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiService apiService;
  CategoryRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> getBookCategories({required num id}) async {
    var response = await apiService.get(endPoint: '/categories/$id');
    var books = response['data']['products'];
    List<BookEntity> booksList = [];
    for (var book in books) {
      booksList.add(BookResponse.fromJson(book).toEntity());
    }
    return booksList;
  }
}
