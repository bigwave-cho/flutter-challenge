import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/challenge/features/main_navigation/view_models/home_view_model.dart';
import 'package:tiktok/challenge/features/main_navigation/view_models/search_view_model.dart';
import 'package:tiktok/challenge/features/main_navigation/widgets/user_tile.dart';
import 'package:tiktok/challenge/features/video/models/photo_model.dart';

class CSearchScreen extends ConsumerStatefulWidget {
  static String routeName = '/search';

  const CSearchScreen({super.key});

  @override
  ConsumerState<CSearchScreen> createState() => _CSearchScreenState();
}

class _CSearchScreenState extends ConsumerState<CSearchScreen> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();

    _textController.addListener(() async {
      ref.read(searchProvider.notifier).getFilteredPosts(_textController.text);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CupertinoSearchTextField(controller: _textController),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              if (_textController.text.isNotEmpty)
                ref.watch(searchProvider).when(
                      data: (data) {
                        if (data.isNotEmpty) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) => ListTile(
                                  title: Text(data[index].description)),
                            ),
                          );
                        }
                        return Center(
                          child: Text('Empty'),
                        );
                      },
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () => const CircularProgressIndicator(),
                    ),
              if (_textController.text.isEmpty)
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      return UserTileWidget();
                    },
                    itemCount: 10,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
