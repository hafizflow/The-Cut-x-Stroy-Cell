import 'package:flutter/material.dart';
import 'package:flutter_extension/util/images.dart';
import 'package:flutter_extension/views/screen/profile/widgets/films_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0.h,
        crossAxisSpacing: 20.w,
        childAspectRatio: 161.5 / 216,
      ),
      itemCount: 3,
      itemBuilder: (context, index) {
        return FilmsCard(
          cardType: FilmCardType.activity,
          imageUrl: Images.cardImage,
          title: "Movie Title - Action",
          ontap: () {},
        );
      },
    );
  }
}
