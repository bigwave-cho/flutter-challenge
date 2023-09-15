// repo는 disk에 데이터 저장 또는 api를 통해 데이터를 불러오는 역할만!

import 'package:shared_preferences/shared_preferences.dart';

class RiverpodConfigRepository {
  static const String _autoplay = 'autoplay';
  static const String _muted = 'muted';

  final SharedPreferences _preference;

  RiverpodConfigRepository(this._preference);

  // View Model에서 repo의 메서드를 통해 데이터를 통제할 수 있도록 함.(read & write)
  Future<void> setMuted(bool value) async {
    _preference.setBool(_muted, value);
  }

  Future<void> setAutoplay(bool value) async {
    _preference.setBool(_autoplay, value);
  }

  bool isMuted() {
    return _preference.getBool(_muted) ?? false;
  }

  bool isAutoplay() {
    return _preference.getBool(_autoplay) ?? false;
  }
}
