import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/challenge/features/profile/models/darkmode_model.dart';
import 'package:tiktok/challenge/features/profile/repo/darkmode_repo.dart';

class DarkModeConfigViewModel extends Notifier<DarkmodeModel> {
  final DarkmodeRepository _repository;

  DarkModeConfigViewModel(this._repository);

  void setDarkmode(bool value) {
    print(value);
    _repository.setDarkmode(value);
    state = DarkmodeModel(isDark: value);
  }

  @override
  build() {
    return DarkmodeModel(isDark: _repository.isDark());
  }
}

final darkmodeConfigProvider =
    NotifierProvider<DarkModeConfigViewModel, DarkmodeModel>(
  () => throw UnimplementedError(),
);
