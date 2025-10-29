import 'package:bookia/core/widgets/book_card.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class SearchGrid extends StatelessWidget {
  const SearchGrid({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.52,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) => BookCard(book: books[index]),
    );
  }
}
