// repo는 disk에 데이터 저장 또는 api를 통해 데이터를 불러오는 역할만!

import 'package:shared_preferences/shared_preferences.dart';

class DarkmodeRepository {
  static const String _isDark = 'isDark';

  final SharedPreferences _preference;

  DarkmodeRepository(this._preference);

  // View Model에서 repo의 메서드를 통해 데이터를 통제할 수 있도록 함.(read & write)
  Future<void> setDarkmode(bool value) async {
    print(value);
    _preference.setBool(_isDark, value);
  }

  bool isDark() {
    return _preference.getBool(_isDark) ?? false;
  }
}
