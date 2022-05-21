import '../../infra/models/item_model.dart';

class PageEntity {
  final List<ItemModel> items;
  final String? tabName;

  PageEntity({
    this.items = const [],
    this.tabName,
  });
}
