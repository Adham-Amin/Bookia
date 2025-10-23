import 'package:bookia/core/utils/app_assets.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/features/home/domain/entities/slider_entity.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderSection extends StatefulWidget {
  const SliderSection({super.key, required this.sliders});

  final List<SliderEntity> sliders;

  @override
  State<SliderSection> createState() => _SliderSectionState();
}

class _SliderSectionState extends State<SliderSection> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.sliders.length,
          options: CarouselOptions(
            height: 150.h,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: widget.sliders[itemIndex].image == ''
                        ? Image.asset(
                            AppAssets.imagesBgWelcome,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          )
                        : Image.network(
                            widget.sliders[itemIndex].image!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                  ),
        ),
        HeightBox(16),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: widget.sliders.length,
          effect: ExpandingDotsEffect(
            spacing: 8.0,
            dotWidth: 7,
            dotHeight: 7,
            paintStyle: PaintingStyle.fill,
            strokeWidth: 1.5,
            dotColor: AppColors.grey,
            activeDotColor: AppColors.primary,
            expansionFactor: 4,
          ),
        ),
      ],
    );
  }
}
