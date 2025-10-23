import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/widgets/book_card.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:bookia/features/home/presentation/widgets/title_and_see_all.dart';
import 'package:flutter/material.dart';

class NewArrivalsList extends StatelessWidget {
  const NewArrivalsList({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndSeeAll(
          title: 'New Arrivals',
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.booksView,
              arguments: {'title': 'New Arrivals', 'books': books},
            );
          },
        ),
        HeightBox(16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.52,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) => BookCard(book: books[index]),
        ),
      ],
    );
  }
}
