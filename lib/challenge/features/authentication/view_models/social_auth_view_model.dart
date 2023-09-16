import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/challenge/features/authentication/repos/authentication.repo.dart';
import 'package:tiktok/utils.dart';
import 'package:go_router/go_router.dart';

class SocialAuthViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;

  Future<void> gitHubSignIn(BuildContext context) async {
    state = const AsyncValue.loading();
    state =
        await AsyncValue.guard(() async => await _repository.gitHubSignIn());

    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.go('/home');
    }
  }

  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }
}

final socialAuthProvider = AsyncNotifierProvider<SocialAuthViewModel, void>(
  () => SocialAuthViewModel(),
);
