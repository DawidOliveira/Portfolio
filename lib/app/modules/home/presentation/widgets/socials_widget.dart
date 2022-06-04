import 'package:flutter/material.dart';
import 'package:portfolio/app/core/app_extensions.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/theme_export.dart';
import '../../infra/models/descriptive_model.dart';

class SocialsWidget extends StatelessWidget {
  const SocialsWidget({
    Key? key,
    required this.descriptive,
  }) : super(key: key);

  final DescriptiveModel descriptive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!descriptive.imageUrl.isNullOrEmpty)
          CircleAvatar(
            backgroundColor: AppColors.primary,
            radius: AppSizes.spacing64px,
            child: CircleAvatar(
              backgroundColor: AppColors.dark,
              radius: AppSizes.spacing64px - AppSizes.spacing4px,
              child: CircleAvatar(
                radius: AppSizes.spacing64px - AppSizes.spacing8px,
                foregroundImage: NetworkImage(
                  descriptive.imageUrl!,
                ),
              ),
            ),
          ),
        if (descriptive.name != null) ...[
          const SizedBox(height: AppSizes.spacing32px),
          Text(
            descriptive.name!,
            style: AppTextStyles.miniTitle.copyWith(
              color: AppColors.snow,
            ),
          ),
        ],
        if (descriptive.social.isNotEmpty) ...[
          const SizedBox(height: AppSizes.spacing8px),
          Wrap(
            spacing: AppSizes.spacing8px,
            alignment: WrapAlignment.center,
            children: [
              ...descriptive.social.map((e) {
                if (e.imageUrl == null) return null;
                return SizedBox(
                  height: AppSizes.spacing48px,
                  width: AppSizes.spacing48px,
                  child: TextButton(
                    onPressed: () async {
                      if (e.redirectTo == null) return;

                      final canLaunch = await canLaunchUrlString(e.redirectTo!);

                      if (!canLaunch) return;

                      launchUrlString(e.redirectTo!);
                    },
                    child: Image.network(
                      e.imageUrl!,
                      height: AppSizes.spacing48px,
                      width: AppSizes.spacing48px,
                      errorBuilder: (_, __, ___) => const FlutterLogo(),
                    ),
                  ),
                );
              }).whereType<Widget>(),
            ],
          ),
        ]
      ],
    );
  }
}
