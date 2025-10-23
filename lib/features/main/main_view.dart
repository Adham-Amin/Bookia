import 'package:bookia/core/utils/app_assets.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  int _currentIndex = 0;

  List<Widget> get _pages => [
    HomeView(),
    Center(child: Text('Wishlist', style: AppStyles.textRegular20)),
    Center(child: Text('Cart', style: AppStyles.textRegular20)),
    Center(child: Text('Profile', style: AppStyles.textRegular20)),
  ];

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => changeTab(index),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: isDark ? AppColors.darkCard : AppColors.white,
        items: [
          BottomNavigationBarItem(
            icon: _navIcon(
              AppAssets.svgsIconHome,
              isActive: _currentIndex == 0,
              isDark: isDark,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _navIcon(
              AppAssets.svgsIconBookmark,
              isActive: _currentIndex == 1,
              isDark: isDark,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: _navIcon(
              AppAssets.svgsIconCategory,
              isActive: _currentIndex == 2,
              isDark: isDark,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: _navIcon(
              AppAssets.svgsIconProfile,
              isActive: _currentIndex == 3,
              isDark: isDark,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _navIcon(
    String asset, {
    required bool isActive,
    required bool isDark,
  }) {
    return SvgPicture.asset(
      asset,
      colorFilter: ColorFilter.mode(
        isActive
            ? AppColors.primary
            : (isDark ? AppColors.white : AppColors.black),
        BlendMode.srcIn,
      ),
    );
  }
}
