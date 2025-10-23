import 'package:bookia/core/models/book_response.dart';
import 'package:bookia/core/services/api_service.dart';
import 'package:bookia/features/home/data/models/category_response.dart';
import 'package:bookia/features/home/data/models/slider_response.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:bookia/features/home/domain/entities/category_entity.dart';
import 'package:bookia/features/home/domain/entities/slider_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<SliderEntity>> getSliders();
  Future<List<CategoryEntity>> getCategories();
  Future<List<BookEntity>> getBookCategories({required int id});
  Future<List<BookEntity>> getBestSellers();
  Future<List<BookEntity>> getNewArrivals();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> getBestSellers() async {
    var response = await apiService.get(endPoint: '/products-bestseller');
    var books = response['data']['products'];
    List<BookEntity> booksList = [];
    for (var book in books) {
      booksList.add(BookResponse.fromJson(book).toEntity());
    }
    return booksList;
  }

  @override
  Future<List<BookEntity>> getBookCategories({required int id}) async {
    var response = await apiService.get(endPoint: '/categories/$id');
    var books = response['data']['products'];
    List<BookEntity> booksList = [];
    for (var book in books) {
      booksList.add(BookResponse.fromJson(book).toEntity());
    }
    return booksList;
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    var response = await apiService.get(endPoint: '/categories');
    var categories = response['data']['categories'];
    List<CategoryEntity> categoriesList = [];
    for (var category in categories) {
      categoriesList.add(CategoryResponse.fromJson(category).toEntity());
    }
    return categoriesList;
  }

  @override
  Future<List<BookEntity>> getNewArrivals() async {
    var response = await apiService.get(endPoint: '/products-new-arrivals');
    var books = response['data']['products'];
    List<BookEntity> booksList = [];
    for (var book in books) {
      booksList.add(BookResponse.fromJson(book).toEntity());
    }
    return booksList;
  }

  @override
  Future<List<SliderEntity>> getSliders() async {
    var response = await apiService.get(endPoint: '/sliders');
    var sliders = response['data']['sliders'];
    List<SliderEntity> slidersList = [];
    for (var slider in sliders) {
      slidersList.add(SliderResponse.fromJson(slider).toEntity());
    }
    return slidersList;
  }
}
