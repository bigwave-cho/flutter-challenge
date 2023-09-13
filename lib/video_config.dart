import 'package:flutter/material.dart';

class VideoConfig extends InheritedWidget {
  const VideoConfig({super.key, required super.child});

  final bool autoMute = true;

  static VideoConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VideoConfig>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

/*
InheritedWidget

1. InheritedWidget으로 최상위 위젯을 감싼다.
2. context.dependOnInheritedWidgetOfExactType<VideoConfig>()를 이용하여 VideoConfig의 state들을 사용가능
3. 위 처럼 of 함수를 만들어서 깔끔하게 할수도.
* updateShouldNotify : true라면  VideoConfig가 업데이트 되면 VideoConfig를 상속받는 위젯들도 업데이트 될 것이다.
 */
