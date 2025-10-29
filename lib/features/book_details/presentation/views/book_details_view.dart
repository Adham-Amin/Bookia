import 'package:bookia/core/widgets/custom_icon_back.dart';
import 'package:bookia/core/widgets/wishlist_button.dart';
import 'package:bookia/features/book_details/presentation/widgets/book_details_view_body.dart';
import 'package:bookia/features/book_details/presentation/widgets/button_book_details.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: CustomIconBack(action: WishlistButton(book: book)),
      body: BookDetailsViewBody(book: book),
      bottomNavigationBar: ButtonBookDetails(book: book, isDark: isDark),
    );
  }
}
