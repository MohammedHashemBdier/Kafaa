import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:kafaa_app/models/top_in_rating_card_model.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/widgets/targets__page/top_in_ratings_card.dart';

class TopInRatingsBody extends StatefulWidget {
  final List<TopInRatingCardModel> cardsData;
  const TopInRatingsBody({
    super.key,
    required this.cardsData,
  });

  @override
  TopInRatingsBodyState createState() => TopInRatingsBodyState();
}

class TopInRatingsBodyState extends State<TopInRatingsBody>
    with SingleTickerProviderStateMixin {
  final SwiperController _swiperController = SwiperController();
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Swiper(
        controller: _swiperController,
        itemCount: widget.cardsData.length,
        itemBuilder: (context, index) {
          final cardData = widget.cardsData[index];
          return SlideTransition(
            position: _slideAnimation,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TopInRatingsCard(
                evoName: cardData.evoName,
                empName: cardData.empName,
                points: cardData.points,
              ),
            ),
          );
        },
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            size: 7,
            activeSize: 10,
            color: AppColors.c5,
            activeColor: AppColors.c1,
          ),
        ),
        control: SwiperControl(
          color: AppColors.c1,
          disableColor: AppColors.c5,
          padding: const EdgeInsets.all(10),
          size: 30,
          iconPrevious: Icons.arrow_back,
          iconNext: Icons.arrow_forward,
        ),
        scrollDirection: Axis.horizontal,
        loop: false,
      ),
    );
  }
}
