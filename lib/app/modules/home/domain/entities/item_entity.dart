import 'package:portfolio/app/modules/home/infra/models/banner_model.dart';
import 'package:portfolio/app/modules/home/infra/models/descriptive_model.dart';

enum ItemType { banner, descriptive }

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
