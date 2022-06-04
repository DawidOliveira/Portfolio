import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_text_styles.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    required this.logoUrl,
  }) : super(key: key);

  final MainAxisAlignment mainAxisAlignment;
  final String logoUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      logoUrl,
      errorBuilder: (context, error, stackTrace) {
        return Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Text(
              '<\\ ',
              style: AppTextStyles.titleLogo.copyWith(
                color: AppColors.primary,
              ),
            ),
            Text(
              logoUrl,
              style: AppTextStyles.titleLogo.copyWith(
                color: AppColors.snow,
              ),
            ),
            Text(
              ' >',
              style: AppTextStyles.titleLogo.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        );
      },
    );
  }
}
