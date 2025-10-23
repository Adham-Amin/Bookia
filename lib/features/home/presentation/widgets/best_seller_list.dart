import 'package:bookia/core/widgets/book_card.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:bookia/features/home/presentation/widgets/title_and_see_all.dart';
import 'package:flutter/material.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndSeeAll(title: 'Best Sellers', onTap: () {}),
        HeightBox(16),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              books.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                  right: index == books.length - 1 ? 0 : 16,
                ),
                child: BookCard(book: books[index]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
