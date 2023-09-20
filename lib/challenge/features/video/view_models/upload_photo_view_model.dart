import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/challenge/features/authentication/repos/authentication.repo.dart';
import 'package:tiktok/challenge/features/video/models/photo_model.dart';
import 'package:tiktok/challenge/features/video/repos/photo_repo.dart';

class UploadPhotoViewModel extends AsyncNotifier<void> {
  late final PhotosRepository _repository;

  Future<void> uploadPhoto({
    required File photo,
    required String description,
  }) async {
    final user = ref.read(authRepo).user;

    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final task = await _repository.uploadPhotoFile(photo, user!.uid);
      print(task);
      if (task.metadata != null) {
        await _repository.savePhoto(
          PhotoModel(
            title: 'title',
            description: description,
            fileUrl: await task.ref.getDownloadURL(),
            creatorUid: user.uid,
            createAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
      }
    });
  }

  @override
  FutureOr<void> build() {
    _repository = ref.read(photoRepo);
  }
}

final uploadPhotoProvider = AsyncNotifierProvider<UploadPhotoViewModel, void>(
  () => UploadPhotoViewModel(),
);
