import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_sizes.dart';
import '../../../../core/app_text_styles.dart';
import '../../infra/models/page_model.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
    required this.pages,
    required this.onPressed,
  }) : super(key: key);

  final List<PageModel> pages;
  final Future<void> Function(int value) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...pages.mapIndexed((i, e) {
          if (e.tabName == null) return null;

          return TextButton(
            onPressed: () {
              onPressed(i);
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
    );
  }
}
