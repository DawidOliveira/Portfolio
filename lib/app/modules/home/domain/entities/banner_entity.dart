class BannerEntity {
  final String id;
  final String? description;
  final String? downloadFileUrl;
  final String? imageUrl;
  final String? textButton;
  final String? tip;
  final String? title;

  BannerEntity({
    required this.id,
    this.description,
    this.downloadFileUrl,
    this.imageUrl,
    this.textButton,
    this.tip,
    this.title,
  });
}
