import 'package:flutter/material.dart';
import 'package:kafaa_app/models/top_in_rating_card_model.dart';
import 'package:kafaa_app/widgets/targets__page/top_in_ratings_body.dart';
import 'package:kafaa_app/widgets/targets__page/top_in_ratings_header.dart';

class TopInRatingSection extends StatelessWidget {
  TopInRatingSection({
    super.key,
  });

  final List<TopInRatingCardModel> cardsData = [
    TopInRatingCardModel(
        empName: 'خالد تللو', evoName: 'معدل المكالمات:', points: 514),
    TopInRatingCardModel(
        empName: 'محمد عبد الله', evoName: 'معدل الدوام:', points: 300),
    TopInRatingCardModel(
        empName: 'أحمد علي', evoName: 'عدد أخطاء المتابعة:', points: 671),
    TopInRatingCardModel(
        empName: 'يوسف حسن', evoName: 'معدل القبول:', points: 320),
    TopInRatingCardModel(
        empName: 'ليلى أحمد', evoName: 'عدد بطاقات المشاكل:', points: 500),
    TopInRatingCardModel(
        empName: 'ليلى أحمد', evoName: 'معدل جودة المكالمة:', points: 270),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopInRatingsHeader(),
        TopInRatingsBody(
          cardsData: cardsData,
        ),
      ],
    );
  }
}
