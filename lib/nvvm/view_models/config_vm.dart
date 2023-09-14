import 'package:flutter/material.dart';
import 'package:tiktok/nvvm/models/config_model.dart';
import 'package:tiktok/nvvm/repo/config_repository.dart';

class ConfigViewModel extends ChangeNotifier {
  final ConfigRepository _repository; // 1. repo를 불러오고

  late final ConfigModel _model = ConfigModel(
    autoplay: _repository.isAutoplay(), // 2. model 인스턴스를 생성
    muted: _repository.isMuted(),
  );

  ConfigViewModel(this._repository);

  // 3. 이 메서드들을 통해서 생성된 model의 상태를 변경
  // ( -> view는 view model로 모델의 데이터를 통제하고 모델의 업데이트된 데이터를 받아서 뷰에 뿌림.)
  void setMuted(bool value) {
    _repository.setMuted(value);
    _model.muted = value;
    notifyListeners();
  }

  void setAutoplay(bool value) {
    _repository.setAutoplay(value);
    _model.autoplay = value;
    notifyListeners();
  }

  // 4. 생성된 model의 데이터를 가져오는 메서드
  bool get muted => _model.muted;
  bool get autoplay => _model.autoplay;
}
