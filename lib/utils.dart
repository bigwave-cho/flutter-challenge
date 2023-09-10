import 'package:flutter/material.dart';

// 통짜바리로 다크모드 설정을 한번에 적용할 때는 theme 에다가 하는게 맞지만
// 세밀하게 커스터마이징 하려면 아래와 같은 함수를 만들어서 하는 것도 좋은 방법.
bool isDarkMode(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.dark;
}
