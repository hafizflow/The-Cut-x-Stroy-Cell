import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/images.dart';
import 'package:flutter_extension/views/base/screen_title.dart';
import 'package:flutter_extension/views/screen/award/widgets/award_text.dart';
import 'package:flutter_extension/views/screen/award/widgets/award_winner_section.dart';
import 'package:flutter_extension/views/screen/award/widgets/nomination_card.dart';
import 'package:flutter_extension/views/screen/award/widgets/stat_row.dart';
import 'package:flutter_extension/views/screen/award/widgets/voting_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AwardScreen extends StatelessWidget {
  const AwardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.h,
            children: [
              const ScreenTitle(title: "Monthly Awards"),
              const VotingTimer(),
              const StatRow(),
              const AwardText(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  Text("Your Nominations", style: AppTextStyles.title14_w500()),
                  NominationCard(
                    imageUrl: Images.nominationCardImage,
                    title: "Short Film Title",
                    author: "Author Name",
                    rating: 4.5,
                    voteCount: 2453,
                    onVotePressed: () {},
                  ),
                  NominationCard(
                    imageUrl: Images.nominationCardImage,
                    title: "Short Film Title",
                    author: "Author Name",
                    rating: 4.5,
                    voteCount: 2453,
                    onVotePressed: () {},
                  ),
                  NominationCard(
                    imageUrl: Images.nominationCardImage,
                    title: "Short Film Title",
                    author: "Author Name",
                    rating: 4.5,
                    voteCount: 2453,
                    onVotePressed: () {},
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("More...", style: AppTextStyles.title12_w400()),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  Text(
                    "Previous Month Winners",
                    style: AppTextStyles.title14_w500(),
                  ),
                  const AwardWinnerSection(
                    title: "Best Short Film",
                    category: "Drama",
                    date: "November 2025",
                  ),
                ],
              ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
