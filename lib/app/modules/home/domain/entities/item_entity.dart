import 'package:portfolio/app/modules/home/infra/models/banner_model.dart';
import 'package:portfolio/app/modules/home/infra/models/descriptive_model.dart';

enum ItemType {
  banner('banner'),
  descriptive('descriptive');

  final String value;

  const ItemType(this.value);

  factory ItemType.strToType(String value) {
    final map = {
      banner.value: banner,
      descriptive.value: descriptive,
    };

    if (map[value] == null) return banner;

    return map[value]!;
  }

  static String? typeToStr(ItemType? value) {
    final map = {
      banner: banner.value,
      descriptive: descriptive.value,
    };

    if (map[value] == null) return null;

    return map[value];
  }
}

class ItemEntity {
  final ItemType? type;
  final BannerModel? banner;
  final DescriptiveModel? descriptive;

  ItemEntity({
    this.type,
    this.banner,
    this.descriptive,
  });
}
