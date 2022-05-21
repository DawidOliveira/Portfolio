import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:portfolio/app/modules/home/domain/entities/home_entity.dart';

import 'page_model.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    super.logoUrl,
    super.pages,
  });

  HomeModel copyWith({
    String? logoUrl,
    List<PageModel>? pages,
  }) {
    return HomeModel(
      logoUrl: logoUrl ?? this.logoUrl,
      pages: pages ?? this.pages,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'logo_url': logoUrl,
      'pages': pages.map((x) => x.toMap()).toList(),
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      logoUrl: map['logo_url'],
      pages:
          List<PageModel>.from(map['pages']?.map((x) => PageModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeModel.fromJson(String source) =>
      HomeModel.fromMap(json.decode(source));

  @override
  String toString() => 'HomeEntity(logoUrl: $logoUrl, pages: $pages)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeModel &&
        other.logoUrl == logoUrl &&
        listEquals(other.pages, pages);
  }

  @override
  int get hashCode => logoUrl.hashCode ^ pages.hashCode;
}
