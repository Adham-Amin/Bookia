import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:bookia/features/home/domain/entities/category_entity.dart';
import 'package:bookia/features/home/domain/entities/slider_entity.dart';
import 'package:bookia/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:bookia/core/errors/failure.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  final HomeRepo homeRepo;

  List<SliderEntity> sliders = [SliderEntity(), SliderEntity(), SliderEntity()];

  List<CategoryEntity> categories = [
    CategoryEntity(id: 1, name: 'Fiction Drama'),
    CategoryEntity(id: 1, name: 'Fiction Drama'),
    CategoryEntity(id: 1, name: 'Fiction Drama'),
  ];

  List<BookEntity> newArrivals = [
    BookEntity(
      title: 'The Great Gatsby',
      category: 'Fiction Drama',
      price: '19.99',
    ),
    BookEntity(
      title: 'The Great Gatsby',
      category: 'Fiction Drama',
      price: '19.99',
    ),
    BookEntity(
      title: 'The Great Gatsby',
      category: 'Fiction Drama',
      price: '19.99',
    ),
    BookEntity(
      title: 'The Great Gatsby',
      category: 'Fiction Drama',
      price: '19.99',
    ),
  ];

  List<BookEntity> bestSellers = [
    BookEntity(
      title: 'The Great Gatsby',
      category: 'Fiction Drama',
      price: '19.99',
    ),
    BookEntity(
      title: 'The Great Gatsby',
      category: 'Fiction Drama',
      price: '19.99',
    ),
    BookEntity(
      title: 'The Great Gatsby',
      category: 'Fiction Drama',
      price: '19.99',
    ),
  ];

  Future<void> getHomeData() async {
    emit(HomeLoading());

    final results = await Future.wait([
      homeRepo.getSliders(),
      homeRepo.getNewArrivals(),
      homeRepo.getBestSellers(),
      homeRepo.getCategories(),
    ]);

    final slidersResult = results[0] as Either<Failure, List<SliderEntity>>;
    final newArrivalsResult = results[1] as Either<Failure, List<BookEntity>>;
    final bestSellersResult = results[2] as Either<Failure, List<BookEntity>>;
    final categoriesResult =
        results[3] as Either<Failure, List<CategoryEntity>>;

    if (slidersResult.isLeft() ||
        newArrivalsResult.isLeft() ||
        bestSellersResult.isLeft() ||
        categoriesResult.isLeft()) {
      final failure =
          slidersResult.fold((f) => f, (_) => null) ??
          newArrivalsResult.fold((f) => f, (_) => null) ??
          bestSellersResult.fold((f) => f, (_) => null) ??
          categoriesResult.fold((f) => f, (_) => null);
      emit(HomeError(message: failure!.message));
      return;
    }

    sliders = slidersResult.getOrElse(() => []);
    newArrivals = newArrivalsResult.getOrElse(() => []);
    bestSellers = bestSellersResult.getOrElse(() => []);
    categories = categoriesResult.getOrElse(() => []);

    emit(HomeLoaded());
  }
}
