import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:portfolio/app/modules/home/domain/entities/page_entity.dart';

import 'item_model.dart';

class PageModel extends PageEntity {
  PageModel({
    super.items,
    super.tabName,
  });

  PageModel copyWith({
    List<ItemModel>? items,
    String? tabName,
  }) {
    return PageModel(
      items: items ?? this.items,
      tabName: tabName ?? this.tabName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'items': items.map((x) => x.toMap()).toList(),
      'tab_name': tabName,
    };
  }

  factory PageModel.fromMap(Map<String, dynamic> map) {
    return PageModel(
      items:
          List<ItemModel>.from(map['items']?.map((x) => ItemModel.fromMap(x))),
      tabName: map['tab_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PageModel.fromJson(String source) =>
      PageModel.fromMap(json.decode(source));

  @override
  String toString() => 'PageModel(items: $items, tabName: $tabName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PageModel &&
        listEquals(other.items, items) &&
        other.tabName == tabName;
  }

  @override
  int get hashCode => items.hashCode ^ tabName.hashCode;
}
