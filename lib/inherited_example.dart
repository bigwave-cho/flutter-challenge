import 'package:flutter/material.dart';

class VideoConfigData extends InheritedWidget {
  //1. autoMute와 toggleMuted 함수를 모든 자식 위젯과 공유하게 됨.
  final bool autoMute;
  final void Function() toggleMuted;

  const VideoConfigData({
    super.key,
    required super.child,
    required this.toggleMuted,
    required this.autoMute,
  });

  static VideoConfigData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VideoConfigData>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

// 2. 자식 위젯에서 toggleMuted를 호출하면 VideoConfig의 setState로 인해 VideoConfig가 리빌드되고
// 또한 VideoConfig이 최상위 위젯이기 때문에 모든 하위 위젯도 리빌드. 그리고 VideoConfigData도 리빌드되면서
// InheritedWidget의 상태도 StatefulWidget의 상태와 같이 새로 업데이트 되게 된다.
class VideoConfig extends StatefulWidget {
  final Widget child;

  const VideoConfig({
    super.key,
    required this.child,
  });

  @override
  State<VideoConfig> createState() => _VideoConfigState();
}

class _VideoConfigState extends State<VideoConfig> {
  bool autoMute = false;

  void toggleMuted() {
    setState(() {
      autoMute = !autoMute;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VideoConfigData(
      toggleMuted: toggleMuted,
      autoMute: autoMute,
      child: widget.child,
    );
  }
}

/*
InheritedWidget

1. InheritedWidget으로 최상위 위젯을 감싼다.
2. context.dependOnInheritedWidgetOfExactType<VideoConfig>()를 이용하여 VideoConfig의 state들을 사용가능
3. 위 처럼 of 함수를 만들어서 깔끔하게 할수도.
* updateShouldNotify : true라면  VideoConfig가 업데이트 되면 VideoConfig를 상속받는 위젯들도 업데이트 될 것이다.
 */

/*
InheritedWidget과 StatefulWidget을 혼합해서 state를 업데이트 해보자.

 */