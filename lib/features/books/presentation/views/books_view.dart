import 'package:bookia/core/utils/app_assets.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/features/books/presentation/widgets/books_view_body.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BooksView extends StatelessWidget {
  const BooksView({super.key, required this.books, required this.title});

  final String title;
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(AppAssets.svgsBack),
          ),
        ),
        title: Text(title, style: AppStyles.textRegular24),
      ),
      body: BooksViewBody(books: books),
    );
  }
}
