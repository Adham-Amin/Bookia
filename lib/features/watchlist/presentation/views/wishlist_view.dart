import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/features/watchlist/presentation/widgets/wishlist_view_body.dart';
import 'package:flutter/material.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Wishlist', style: AppStyles.textRegular24),
      ),
      body: WishlistViewBody(),
    );
  }
}
