import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/nvvm_with_provider/models/config_model.dart';
import 'package:tiktok/nvvm_with_riverpod/repo/config_repository.dart';

class RiverpodConfigViewModel extends Notifier<ConfigModel> {
  final RiverpodConfigRepository _repository;

  RiverpodConfigViewModel(this._repository);

  void setMuted(bool value) {
    _repository.setMuted(value);
    //  state.muted = value;  state로 데이터 model의 state에 접근 가능

    // 새로운 인스턴스를 생성해서 state를 통째로 대체
    state = ConfigModel(
      muted: value,
      autoplay: state.autoplay,
    );
  }

  void setAutoplay(bool value) {
    _repository.setAutoplay(value);
    state = ConfigModel(
      muted: state.muted,
      autoplay: value,
    );
  }

// 사용자가 보게 될 init data 반환
  @override
  build() {
    return ConfigModel(
      autoplay: _repository.isAutoplay(),
      muted: _repository.isMuted(),
    );
  }
}

// NotifireProvider<Notifier을 extends한 뷰모델 인스턴스, user에 반환하는 state>()

final riverpodConfigProvider =
    NotifierProvider<RiverpodConfigViewModel, ConfigModel>(
  // () => RiverpodConfigViewModel(), => 원래는 이렇게..
  () => throw UnimplementedError(), // 지금은 repository를 전달해서 생성해야하는데 그게 안돼서 임시방편
);

// SharePref 생성을 기다린 후에 riverpodConfigProvider를 ViewModel을 반환하도록 override시킬 예정

// main.dart의 providerScope의 override를 이용하면 가능!@!@
