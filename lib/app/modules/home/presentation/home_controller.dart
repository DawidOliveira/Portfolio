import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/home/domain/entities/home_entity.dart';
import 'package:portfolio/app/modules/home/domain/usecases/get_home_usecase.dart';
import 'package:portfolio/app/shared/mixins/loading_mixin.dart';

class HomeController extends ChangeNotifier with LoadingMixin {
  final GetHomeUsecase _getHomeUsecase;

  HomeController({
    required GetHomeUsecase getHomeUsecase,
  }) : _getHomeUsecase = getHomeUsecase {
    init();
  }

  final pageController = PageController();
  final scrollController = ScrollController();

  final _home = ValueNotifier<HomeEntity?>(null);
  final _currentPage = ValueNotifier<int>(0);

  HomeEntity? get home => _home.value;
  set home(HomeEntity? value) => _home.value = value;

  int get currentPage => _currentPage.value;
  set currentPage(int value) => _currentPage.value = value;

  Future<void> init() async {
    await execute(() async {
      final result = await _getHomeUsecase();

      result.fold(
        (l) => null,
        (r) => home = r,
      );
    });
  }

  Future<void> changePage(int value) async {
    currentPage = value;
    notifyListeners();
    await pageController.animateToPage(
      value,
      duration: kThemeAnimationDuration,
      curve: Curves.linear,
    );
  }
}
