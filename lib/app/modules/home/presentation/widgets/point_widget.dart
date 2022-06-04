import 'package:flutter/material.dart';

import '../../../../core/theme_export.dart';

class PointWidget extends StatelessWidget {
  const PointWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: AppColors.primary,
          height: AppSizes.spacing16px,
          width: AppSizes.spacing16px,
        ),
        Container(
          color: AppColors.dark,
          height: AppSizes.spacing16px - AppSizes.spacing4px,
          width: AppSizes.spacing16px - AppSizes.spacing4px,
        ),
        Container(
          color: AppColors.primary,
          height: AppSizes.spacing16px - AppSizes.spacing8px,
          width: AppSizes.spacing16px - AppSizes.spacing8px,
        ),
      ],
    );
  }
}
