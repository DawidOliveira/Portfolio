import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:portfolio/app/modules/home/domain/entities/descriptive_entity.dart';

import 'social_model.dart';

class DescriptiveModel extends DescriptiveEntity {
  DescriptiveModel({
    super.social,
    super.imageUrl,
    super.name,
    super.subtitle,
    super.text,
    super.title,
  });

  DescriptiveModel copyWith({
    String? imageUrl,
    String? name,
    String? subtitle,
    String? title,
    String? text,
    List<SocialModel>? social,
  }) {
    return DescriptiveModel(
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      subtitle: subtitle ?? this.subtitle,
      title: title ?? this.title,
      text: text ?? this.text,
      social: social ?? this.social,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image_url': imageUrl,
      'name': name,
      'subtitle': subtitle,
      'title': title,
      'text': text,
      'social': social.map((x) => x.toMap()).toList(),
    };
  }

  factory DescriptiveModel.fromMap(Map<String, dynamic> map) {
    return DescriptiveModel(
      imageUrl: map['image_url'],
      name: map['name'],
      subtitle: map['subtitle'],
      title: map['title'],
      text: map['text'],
      social: List<SocialModel>.from(
          map['social']?.map((x) => SocialModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DescriptiveModel.fromJson(String source) =>
      DescriptiveModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DescriptiveModel(imageUrl: $imageUrl, name: $name, subtitle: $subtitle, title: $title, text: $text, social: $social)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DescriptiveModel &&
        other.imageUrl == imageUrl &&
        other.name == name &&
        other.subtitle == subtitle &&
        other.title == title &&
        other.text == text &&
        listEquals(other.social, social);
  }

  @override
  int get hashCode {
    return imageUrl.hashCode ^
        name.hashCode ^
        subtitle.hashCode ^
        title.hashCode ^
        text.hashCode ^
        social.hashCode;
  }
}
