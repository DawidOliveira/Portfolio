import 'dart:convert';

import 'package:portfolio/app/modules/home/domain/entities/item_entity.dart';

import 'banner_model.dart';
import 'descriptive_model.dart';

class ItemModel extends ItemEntity {
  ItemModel({
    super.banner,
    super.descriptive,
    super.type,
  });

  ItemModel copyWith({
    ItemType? type,
    BannerModel? banner,
    DescriptiveModel? descriptive,
  }) {
    return ItemModel(
      type: type ?? this.type,
      banner: banner ?? this.banner,
      descriptive: descriptive ?? this.descriptive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': ItemType.typeToStr(type),
      'banner': banner?.toMap(),
      'descriptive': descriptive?.toMap(),
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      type: ItemType.strToType(map['type']),
      banner: map['banner'] != null ? BannerModel.fromMap(map['banner']) : null,
      descriptive: map['descriptive'] != null
          ? DescriptiveModel.fromMap(map['descriptive'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ItemModel(type: $type, banner: $banner, descriptive: $descriptive)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemModel &&
        other.type == type &&
        other.banner == banner &&
        other.descriptive == descriptive;
  }

  @override
  int get hashCode => type.hashCode ^ banner.hashCode ^ descriptive.hashCode;
}
