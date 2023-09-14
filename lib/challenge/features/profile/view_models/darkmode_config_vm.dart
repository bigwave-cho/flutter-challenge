import 'package:flutter/material.dart';
import 'package:tiktok/challenge/features/profile/models/darkmode_model.dart';
import 'package:tiktok/challenge/features/profile/repo/darkmode_repo.dart';

class DarkModeConfigViewModel extends ChangeNotifier {
  final DarkmodeRepository _repository; // 1. repo를 불러오고

  late final DarkmodeModel _model = DarkmodeModel(
    isDark: _repository.isDark(),
  );

  DarkModeConfigViewModel(this._repository);

  // 3. 이 메서드들을 통해서 생성된 model의 상태를 변경
  // ( -> view는 view model로 모델의 데이터를 통제하고 모델의 업데이트된 데이터를 받아서 뷰에 뿌림.)
  void setDarkmode(bool value) {
    _repository.setDarkmode(value);
    _model.isDark = value;
    notifyListeners();
  }

  // 4. 생성된 model의 데이터를 가져오는 메서드
  bool get isDark => _model.isDark;
}
