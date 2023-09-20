import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/challenge/features/video/photo_screen.dart';
import 'package:tiktok/challenge/features/video/view_models/upload_photo_view_model.dart';
import 'package:tiktok/constants/sizes.dart';

class PostThreadScreen extends ConsumerStatefulWidget {
  const PostThreadScreen({super.key});

  @override
  ConsumerState<PostThreadScreen> createState() => _PostThreadScreenState();
}

class _PostThreadScreenState extends ConsumerState<PostThreadScreen> {
  final TextEditingController _textFormFieldController =
      TextEditingController();

  bool _isWriting = false;

  @override
  void initState() {
    super.initState();
    _textFormFieldController.addListener(() {
      if (_textFormFieldController.text.length > 0) {
        _isWriting = true;
        setState(() {});
      } else {
        _isWriting = false;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _textFormFieldController.dispose();
    super.dispose();
  }

  String? imagePath;
  XFile? photoFile;

  Future<void> _getPhoto() async {
    final prop = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PhotoScreen(),
      ),
    );

    imagePath = prop['filePath'];
    photoFile = prop['file'];
    setState(() {});
  }

  void _onUplodaThread() async {
    if (photoFile != null) {
      ref.read(uploadPhotoProvider.notifier).uploadPhoto(
            photo: File(photoFile!.path),
            description: _textFormFieldController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Text("New thread"),
          leading: Container(
            alignment: Alignment.center,
            child: Text('Cancel'),
          ),
          elevation: 1,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Column(
                  children: [
                    // 메인 내용 부분
                    IntrinsicHeight(
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              //프로필 이미지
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const CircleAvatar(
                                      radius: 29,
                                      backgroundColor: Colors.black,
                                      //이미지 넣어주기
                                      foregroundImage: NetworkImage(
                                        'https://images.unsplash.com/photo-1682687982468-4584ff11f88a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
                                      ),
                                    ),
                                    Positioned(
                                      right: -7,
                                      bottom: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(99),
                                          border: Border.all(
                                              width: 3, color: Colors.white),
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //아래 세로줄
                              Expanded(
                                child: Container(
                                  width: 1,
                                  // height: 280,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.yellow,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // 유저이름 ,내용 , 사진, 이모티콘부분
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Jane_mobbin',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: Stack(
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.certificate,
                                                color: Colors.blue.shade300,
                                                size: 20,
                                              ),
                                              const Align(
                                                alignment: Alignment.center,
                                                child: FaIcon(
                                                  FontAwesomeIcons.check,
                                                  color: Colors.white,
                                                  size: 10,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: TextFormField(
                                    controller: _textFormFieldController,
                                    maxLines: null,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                //사진 작업
                                if (imagePath != null)
                                  Container(
                                    width: 320,
                                    height: 200,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Stack(children: [
                                      Positioned.fill(
                                        child: Image(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                            File(imagePath!),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: InkWell(
                                          onTap: () {
                                            imagePath = null;
                                            setState(() {});
                                          },
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircleXmark,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                InkWell(
                                  onTap: _getPhoto,
                                  child: const Icon(
                                    Icons.plumbing_outlined,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Anyone can reply'),
                    TextButton(
                      onPressed: () {
                        _onUplodaThread();
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                          color:
                              _isWriting ? Colors.blue.shade400 : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
