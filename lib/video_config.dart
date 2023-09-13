import 'package:flutter/material.dart';

class VideoConfig extends ChangeNotifier {
  bool autoMute = false;

  void toggleAutoMute() {
    autoMute = !autoMute;
    notifyListeners();
    /*
    Call this method whenever the object changes, to notify any clients the object may have changed

    상태 변경 시 리스닝하고 있는 위젯도 업데이트 해야할 때
    notifyListeners() 호출. 마치 setState로 리빌드 하는 것 같다.
     */
  }
}

// ChangeNotifier는 여러 값이나
// API를 다룰 때 좋다.
final videoConfig = VideoConfig();

// 단순한 원시값등을 다룰 때는 ValueNotifier 추천
final vidoeConfig2 = ValueNotifier(false);
