import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/core/widgets/loading_grid_books.dart';
import 'package:bookia/features/search/presentation/cubit/search_cubit.dart';
import 'package:bookia/features/search/presentation/widgets/search_grid.dart';
import 'package:bookia/features/search/presentation/widgets/search_now.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Search',
            onChanged: (q) => context.read<SearchCubit>().searchBooks(query: q),
          ),
          HeightBox(24),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccess) {
                  if (state.books.isEmpty) {
                    return SearchNow(title: 'No Result');
                  }
                  return SearchGrid(books: state.books);
                } else if (state is SearchError) {
                  return Center(
                    child: Text(state.message, style: AppStyles.textRegular16),
                  );
                } else if (state is SearchLoading) {
                  return LoadingGridBooks(isPadding: false);
                } else {
                  return SearchNow(title: 'Search Now');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
