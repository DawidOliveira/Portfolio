import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app/core/app_colors.dart';
import 'package:portfolio/app/modules/home/domain/entities/item_entity.dart';
import 'package:portfolio/app/modules/home/presentation/home_controller.dart';
import 'package:portfolio/app/modules/home/presentation/widgets/banner_widget.dart';

import '../infra/models/item_model.dart';
import 'widgets/header_widget.dart';

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
      builder: (context, child) {
        if (controller.home == null || controller.isLoading) {
          return const SizedBox.shrink();
        }

        return Scaffold(
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
            child: Column(
              children: [
                HeaderWidget(controller: controller),
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.home?.pages.length ?? 0,
                    onPageChanged: controller.changePage,
                    itemBuilder: (context, index) {
                      final page = controller.home?.pages[index];
                      return Column(
                        children: [
                          ...page?.items.map((e) => e.buildWidget) ?? [],
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

extension ItemWidget on ItemModel? {
  Widget get buildWidget {
    if (this == null) return const SizedBox.shrink();

    final map = {
      ItemType.banner: (ItemModel item) {
        final banner = item.banner;

        if (banner == null) return const SizedBox.shrink();

        return BannerWidget(banner: banner);
      },
      ItemType.descriptive: (ItemModel item) => const SizedBox(),
    };

    if (map[this!.type] == null) return const SizedBox.shrink();

    return Expanded(
      child: map[this!.type]!(this!),
    );
  }
}
