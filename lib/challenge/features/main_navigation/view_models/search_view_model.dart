import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/challenge/features/video/repos/photo_repo.dart';

import '../../video/models/photo_model.dart';

class SearchViewModel extends AsyncNotifier<List<PhotoModel>> {
  late final PhotosRepository _repository;

  List<PhotoModel> _list = [];

  updatePhotos() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final result = await _repository.fetchPhotos();
      final newList = result.docs.map(
        (doc) => PhotoModel.fromJson(
          doc.data(),
        ),
      );

      return newList.toList();
    });
  }

  getFilteredPosts(String query) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await _repository.fetchPhotos();
      final newList = result.docs.map(
        (doc) => PhotoModel.fromJson(
          doc.data(),
        ),
      );

      List<PhotoModel> filteredList =
          newList.where((post) => post.description.contains(query)).toList();

      return filteredList;
    });
  }

  @override
  FutureOr<List<PhotoModel>> build() async {
    _repository = ref.read(photoRepo);

    final result = await _repository.fetchPhotos();
    final newList = result.docs.map(
      (doc) => PhotoModel.fromJson(
        doc.data(),
      ),
    );

    _list = newList.toList();

    return _list;
  }
}

final searchProvider = AsyncNotifierProvider<SearchViewModel, List<PhotoModel>>(
  () => SearchViewModel(),
);


/*
   List<PhotoModel> filteredList =
          newList.where((post) => post.description.contains(query)).toList();
 */