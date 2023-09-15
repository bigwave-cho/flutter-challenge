import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/nvvm_with_riverpod/view_models/Async_view_model.dart';

class RiverpodStfExample extends ConsumerStatefulWidget {
  const RiverpodStfExample({Key? key}) : super(key: key);

  @override
  ConsumerState<RiverpodStfExample> createState() => _RiverpodStfExampleState();
}

class _RiverpodStfExampleState extends ConsumerState<RiverpodStfExample> {
  void _onUploadPressed() {
    ref.read(asyncProvider.notifier).uploadSomething();
  }

  @override
  Widget build(BuildContext context) {
    // .when 조건을 달 수 있음. : async 가 future를 반환하기를 기다려줌 에러 안뱉도록
    return ref.watch(asyncProvider).when(
          loading: (() => const Center(
                child: CircularProgressIndicator.adaptive(),
              )),
          error: (error, stackTrace) => const Center(
            child: Text('could not load!'),
          ),
          data: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => Container(
              child: GestureDetector(
                onTap: _onUploadPressed,
                child: Text(data[index].title),
              ),
            ),
          ),
        );
  }
}
