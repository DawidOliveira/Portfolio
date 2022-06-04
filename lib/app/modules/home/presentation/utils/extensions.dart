import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/home/presentation/widgets/banner_widget.dart';

import '../../domain/entities/item_entity.dart';
import '../../infra/models/item_model.dart';

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

    return map[this!.type]!(this!);
  }
}
