import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/nvvm_with_riverpod/models/async_model.dart';

class AsyncViewModel extends AsyncNotifier<List<AsyncModel>> {
  List<AsyncModel> _list = [
    // 임시로 하나 넣어보자
    AsyncModel(title: '올랄라라라~~'),
  ];

  void uploadSomething() async {
    // ViewModel이 Loading 상태가 되도록.
    state = AsyncValue.loading();

    await Future.delayed(const Duration(seconds: 2));

    final newVideo = AsyncModel(title: "${DateTime.now()}");
    // _list.add(newVideo)
    // Async Noti는 tate의 변화를 감지하고 관련된 리스너들에게 알림을 보내고
    // 리스너는 화면을 리렌더링 함.
    // 근데 객체의 속성 변경은 state가 변했다고 알아차리지 못하기 때문에
    // 아예 새로운 객체를 할당하여 AsyncNoti가 state 변경을 감지하도록 한다.

    _list = [..._list, newVideo];
    // ViewModel이 data를 반환하는 state가 됨.
    state = AsyncValue.data(_list);
  }

  // FutureOr : Future or model을 반환
  // build : 초기 data를 반환함.
  @override
  FutureOr<List<AsyncModel>> build() async {
    // api 대신 delayed로 데이터 불러오는 뻥카 침
    await Future.delayed(const Duration(seconds: 5));

    return _list;
  }
}

final asyncProvider = AsyncNotifierProvider<AsyncViewModel, List<AsyncModel>>(
  () => AsyncViewModel(),
);
