import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/challenge/features/authentication/repos/authentication.repo.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  Future<void> signUp() async {
    state = AsyncValue.loading();

    final form = ref.read(signUpForm);

    /* 
    ** 원래 방식
    await _authRepo.signUp(form['email'], form['password'])
    state = AsyncValue.data(null);

    */

    // AsyncValue.guard!
    state = await AsyncValue.guard(
        () async => await _authRepo.signUp(form['email'], form['password']));

    /*
    static Future<AsyncValue<T>> guard<T>(Future<T> Function() future) async {
      // try catch로 data fetching 성공시 state를 data로 실패하면 state를 error 상태로 반환
    try {
      return AsyncValue.data(await future());
    } catch (err, stack) {
      return AsyncValue.error(err, stack);
    }
  }
     */
  }

  // build는 init때 데이터 반환 외에 이런식으로 onInit처럼 작동함
  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }
}

// StateProvider : 바깥에서 수정 가능한 value를 expose  여기선 빈 map을 expose
final signUpForm = StateProvider((ref) => {});

// 기존 노티파이어 프로바이더가 있어야 watch 가능
final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
