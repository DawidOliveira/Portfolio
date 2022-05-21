import '../../infra/models/social_model.dart';

class DescriptiveEntity {
  final String? imageUrl;
  final String? name;
  final String? subtitle;
  final String? title;
  final String? text;
  final List<SocialModel> social;

  DescriptiveEntity({
    this.imageUrl,
    this.name,
    this.subtitle,
    this.title,
    this.text,
    this.social = const [],
  });
}
