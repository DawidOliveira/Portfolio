import 'package:flutter/cupertino.dart';

mixin LoadingMixin on ChangeNotifier {
  final _isLoading = ValueNotifier<bool>(false);

  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  Future<void> execute(Future Function() fn) async {
    isLoading = true;
    await fn();
    isLoading = false;
    notifyListeners();
  }
}
