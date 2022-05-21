import 'dart:convert';

import 'package:portfolio/app/modules/home/domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  BannerModel({
    required super.id,
    super.description,
    super.downloadFileUrl,
    super.imageUrl,
    super.textButton,
    super.tip,
    super.title,
  });

  BannerModel copyWith({
    String? id,
    String? description,
    String? downloadFileUrl,
    String? imageUrl,
    String? textButton,
    String? tip,
    String? title,
  }) {
    return BannerModel(
      id: id ?? this.id,
      description: description ?? this.description,
      downloadFileUrl: downloadFileUrl ?? this.downloadFileUrl,
      imageUrl: imageUrl ?? this.imageUrl,
      textButton: textButton ?? this.textButton,
      tip: tip ?? this.tip,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'download_file_url': downloadFileUrl,
      'image_url': imageUrl,
      'text_button': textButton,
      'tip': tip,
      'title': title,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'] ?? '',
      description: map['description'],
      downloadFileUrl: map['download_file_url'],
      imageUrl: map['image_url'],
      textButton: map['text_button'],
      tip: map['tip'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BannerModel(id: $id, description: $description, downloadFileUrl: $downloadFileUrl, imageUrl: $imageUrl, textButton: $textButton, tip: $tip, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BannerModel &&
        other.id == id &&
        other.description == description &&
        other.downloadFileUrl == downloadFileUrl &&
        other.imageUrl == imageUrl &&
        other.textButton == textButton &&
        other.tip == tip &&
        other.title == title;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        downloadFileUrl.hashCode ^
        imageUrl.hashCode ^
        textButton.hashCode ^
        tip.hashCode ^
        title.hashCode;
  }
}
