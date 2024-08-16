import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_images.dart';
import 'package:kafaa_app/utils/app_styles.dart';

class TopInRatingsCard extends StatelessWidget {
  final String empName, evoName;
  final int points;

  const TopInRatingsCard(
      {super.key,
      required this.empName,
      required this.points,
      required this.evoName});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(Assets.imagesTopInRatingsCard),
                fit: BoxFit.cover,
              ),
              color: AppColors.c4,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                evoName,
                style: AppStyles.styleBold24(context)
                    .copyWith(color: AppColors.c5),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(empName, style: AppStyles.styleSemiBold16(context)),
                Text(points.toString(),
                    style: AppStyles.styleSemiBold16(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
