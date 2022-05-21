import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/core/extensions.dart';
import 'package:portfolio/app/shared/utils/responsive_data.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_sizes.dart';
import '../../../../core/app_text_styles.dart';
import '../home_controller.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppSizes.spacing32px,
        horizontal: isMobile ? 0 : AppSizes.spacing32px,
      ),
      height: AppSizes.spacing64px,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          !controller.home!.logoUrl.isNullOrEmpty
              ? Image.network(
                  controller.home!.logoUrl!,
                  errorBuilder: (context, error, stackTrace) {
                    return const FlutterLogo(
                      size: AppSizes.spacing128px,
                      style: FlutterLogoStyle.horizontal,
                    );
                  },
                )
              : const SizedBox.shrink(),
          Row(
            children: [
              ...controller.home!.pages.mapIndexed((i, e) {
                if (e.tabName == null) return null;

                return TextButton(
                  onPressed: () {
                    controller.changePage(i);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        e.tabName!,
                        style: AppTextStyles.nav.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                      Container(
                        width: AppSizes.spacing16px,
                        decoration: BoxDecoration(
                          borderRadius: AppSizes.borderRadius4px,
                        ),
                        child: const Divider(
                          color: AppColors.primary,
                          height: AppSizes.spacing2px,
                          thickness: AppSizes.spacing4px,
                        ),
                      ),
                    ],
                  ),
                );
              }).whereType<Widget>(),
            ],
          )
        ],
      ),
    );
  }
}
