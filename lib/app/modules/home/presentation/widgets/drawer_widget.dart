import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/core/app_extensions.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_text_styles.dart';
import '../../infra/models/page_model.dart';
import 'logo_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
    this.logoUrl,
    this.scrollController,
    required this.pages,
    required this.changePage,
  }) : super(key: key);

  final String? logoUrl;
  final ScrollController? scrollController;
  final List<PageModel> pages;
  final Future<void> Function(int value) changePage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.dark,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: !logoUrl.isNullOrEmpty
                    ? LogoWidget(
                        logoUrl: logoUrl!,
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            ...pages.mapIndexed((i, e) {
              if (e.tabName == null) return null;

              return ListTile(
                onTap: () {
                  changePage(i);
                  Navigator.pop(context);
                },
                title: Text(
                  e.tabName!,
                  style: AppTextStyles.nav.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              );
            }).whereType<Widget>(),
          ],
        ),
      ),
    );
  }
}
