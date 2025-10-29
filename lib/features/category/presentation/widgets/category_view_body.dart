import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/book_card.dart';
import 'package:bookia/features/category/presentation/cubit/category_cubit.dart';
import 'package:bookia/core/widgets/loading_grid_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoaded) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.52,
              ),
              itemCount: state.books.length,
              itemBuilder: (context, index) =>
                  BookCard(book: state.books[index]),
            ),
          );
        } else if (state is CategoryError) {
          return Center(
            child: Text(state.message, style: AppStyles.textRegular16),
          );
        } else {
          return LoadingGridBooks();
        }
      },
    );
  }
}
