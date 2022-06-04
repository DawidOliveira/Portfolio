import 'package:flutter/material.dart';
import 'package:portfolio/app/core/app_responsive.dart';

import '../../../../core/theme_export.dart';
import '../../infra/models/descriptive_model.dart';
import 'point_widget.dart';
import 'socials_widget.dart';

class DescriptiveWidget extends StatelessWidget {
  const DescriptiveWidget({
    Key? key,
    required this.descriptive,
  }) : super(key: key);

  final DescriptiveModel descriptive;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing32px),
      width: size.width,
      child: Column(
        children: [
          if (AppResponsive.isMobile) ...[
            SocialsWidget(descriptive: descriptive),
            const SizedBox(height: AppSizes.spacing128px),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!AppResponsive.isMobile) ...[
                SocialsWidget(descriptive: descriptive),
                const SizedBox(width: AppSizes.spacing128px),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (descriptive.title != null)
                      Row(
                        children: [
                          const PointWidget(),
                          const SizedBox(width: AppSizes.spacing8px),
                          Text(
                            descriptive.title!,
                            style: AppTextStyles.miniTitle.copyWith(
                              color: AppColors.snow,
                            ),
                          ),
                        ],
                      ),
                    if (descriptive.subtitle != null) ...[
                      const SizedBox(height: AppSizes.spacing32px),
                      Text(
                        descriptive.subtitle!,
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.snow,
                        ),
                      ),
                    ],
                    if (descriptive.text != null) ...[
                      const SizedBox(height: AppSizes.spacing16px),
                      SelectableText(
                        descriptive.text!,
                        style: AppTextStyles.nav.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
