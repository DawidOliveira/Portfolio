import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app/core/app_colors.dart';
import 'package:portfolio/app/core/app_extensions.dart';
import 'package:portfolio/app/core/app_responsive.dart';
import 'package:portfolio/app/core/app_sizes.dart';
import 'package:portfolio/app/modules/home/presentation/home_controller.dart';
import 'package:portfolio/app/modules/home/presentation/utils/extensions.dart';

import 'widgets/drawer_widget.dart';
import 'widgets/logo_widget.dart';
import 'widgets/menu_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        if (controller.home == null || controller.isLoading) {
          return const SizedBox.shrink();
        }

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.transparent,
            title: !controller.home!.logoUrl.isNullOrEmpty
                ? LogoWidget(
                    logoUrl: controller.home!.logoUrl!,
                    mainAxisAlignment: MainAxisAlignment.start,
                  )
                : const SizedBox.shrink(),
            actions: [
              if (!AppResponsive.isMobile)
                MenuWidget(
                  onPressed: controller.changePage,
                  pages: controller.home?.pages ?? [],
                )
            ],
          ),
          drawer: AppResponsive.isMobile
              ? DrawerWidget(
                  changePage: controller.changePage,
                  pages: controller.home?.pages ?? [],
                  logoUrl: controller.home?.logoUrl,
                  scrollController: controller.scrollController,
                )
              : null,
          body: Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.dark, AppColors.darkLight],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: PageView.builder(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.home?.pages.length ?? 0,
                onPageChanged: controller.changePage,
                itemBuilder: (context, index) {
                  final page = controller.home?.pages[index];
                  return SingleChildScrollView(
                    child: Wrap(
                      direction: Axis.vertical,
                      spacing: AppSizes.spacing128px,
                      children: [
                        const SizedBox.shrink(),
                        ...page?.items.map((e) => e.buildWidget) ?? [],
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
