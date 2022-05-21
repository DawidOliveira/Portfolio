import 'package:portfolio/app/modules/home/infra/models/page_model.dart';

class HomeEntity {
  final String? logoUrl;
  final List<PageModel> pages;

  HomeEntity({
    this.logoUrl,
    this.pages = const [],
  });
}
