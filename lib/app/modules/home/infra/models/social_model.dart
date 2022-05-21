import 'dart:convert';

import 'package:portfolio/app/modules/home/domain/entities/social_entity.dart';

class SocialModel extends SocialEntity {
  SocialModel({super.imageUrl, super.redirectTo});

  SocialModel copyWith({
    String? imageUrl,
    String? redirectTo,
  }) {
    return SocialModel(
      imageUrl: imageUrl ?? this.imageUrl,
      redirectTo: redirectTo ?? this.redirectTo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image_url': imageUrl,
      'redirect_to': redirectTo,
    };
  }

  factory SocialModel.fromMap(Map<String, dynamic> map) {
    return SocialModel(
      imageUrl: map['image_url'],
      redirectTo: map['redirect_to'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialModel.fromJson(String source) =>
      SocialModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'SocialModel(imageUrl: $imageUrl, redirectTo: $redirectTo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SocialModel &&
        other.imageUrl == imageUrl &&
        other.redirectTo == redirectTo;
  }

  @override
  int get hashCode => imageUrl.hashCode ^ redirectTo.hashCode;
}
