import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/reviews_page/add_review_section.dart';

class ReviewsDesktopLayout extends StatelessWidget {
  const ReviewsDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: AppDrawer()),
        SizedBox(width: 30),
        Expanded(
          flex: 4,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 40, bottom: 40, right: 20, left: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: AddReviewSection(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
