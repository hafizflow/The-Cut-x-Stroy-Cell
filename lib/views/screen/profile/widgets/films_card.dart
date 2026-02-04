import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum FilmCardType { myFilms, favourites, activity }

class FilmsCard extends StatelessWidget {
  final FilmCardType cardType;
  final String imageUrl;
  final String? title;
  final String? duration;
  final VoidCallback? onFavoriteTap;

  const FilmsCard({
    super.key,
    required this.cardType,
    required this.imageUrl,
    this.title,
    this.duration,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 161.5.w,
          height: 190.h,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0.r),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              if (favourites())
                Positioned(
                  top: 10.h,
                  left: 10.w,
                  child: _buildBadge(
                    color: AppColors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2.5,
                    ),
                    child: Text(
                      "New",
                      style: AppTextStyles.title12_w500(color: Colors.white),
                    ),
                  ),
                ),

              if (favourites())
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: GestureDetector(
                    onTap: onFavoriteTap,
                    child: Container(
                      padding: EdgeInsets.all(2.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Center(
                        child: SvgImageWidget.asset(
                          Logos.loveFill,
                          width: 14.w,
                          height: 14.h,
                        ),
                      ),
                    ),
                  ),
                ),

              if (favourites() || myFilms())
                Positioned(
                  bottom: 10.h,
                  right: 10.w,
                  child: _buildBadge(
                    color: AppColors.secondaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2.5,
                    ),
                    child: Text(
                      duration ?? "18:21",
                      style: AppTextStyles.title12_w500(color: Colors.white),
                    ),
                  ),
                ),

              if (myFilms() || activity())
                Positioned(
                  top: 10.h,
                  left: 10.w,
                  child: Row(
                    spacing: 4.w,
                    children: [
                      SvgImageWidget.asset(
                        Logos.view,
                        width: 16.w,
                        height: 16.h,
                        color: Colors.white,
                      ),
                      Text(
                        "1.1M",
                        style: AppTextStyles.title12_w500(color: Colors.white),
                      ),
                    ],
                  ),
                ),

              if (myFilms() || activity())
                Positioned(
                  bottom: 10.h,
                  left: 10.w,
                  child: Row(
                    spacing: 4.w,
                    children: [
                      SvgImageWidget.asset(
                        Logos.love,
                        width: 16.w,
                        height: 16.h,
                        color: Colors.white,
                      ),
                      Text(
                        "1.1k",
                        style: AppTextStyles.title12_w500(color: Colors.white),
                      ),
                    ],
                  ),
                ),

              if (activity())
                Positioned(
                  bottom: 10.h,
                  right: 10.w,
                  child: _buildBadge(
                    color: AppColors.greenBg,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2.5,
                    ),
                    child: Text(
                      "Approved",
                      style: AppTextStyles.title12_w500(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        if (title != null)
          Text(
            title!,
            style: AppTextStyles.title12_w500(color: Colors.black),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
      ],
    );
  }

  bool favourites() {
    return cardType == FilmCardType.favourites;
  }

  bool myFilms() {
    return cardType == FilmCardType.myFilms;
  }

  bool activity() {
    return cardType == FilmCardType.activity;
  }

  Widget _buildBadge({
    required Color color,
    required Widget child,
    EdgeInsets? padding,
  }) {
    return Container(
      padding: padding ?? EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: child,
    );
  }
}
