import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/utils/app_assets.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/features/search/domain/repo/search_repo.dart';
import 'package:bookia/features/search/presentation/cubit/search_cubit.dart';
import 'package:bookia/features/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(searchRepo: getIt<SearchRepo>()),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(AppAssets.svgsBack),
            ),
          ),
          centerTitle: true,
          title: Text('Search', style: AppStyles.textRegular24),
        ),
        body: SearchViewBody(),
      ),
    );
  }
}
